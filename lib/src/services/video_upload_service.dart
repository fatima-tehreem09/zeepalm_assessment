import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart' as path;

final videoUploadServiceProvider = Provider<VideoUploadService>((ref) {
  return VideoUploadService();
});

class VideoUploadService {
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> uploadVideo({
    required File videoFile,
    required String userId,
    required String caption,
    required Function(double) onProgress,
  }) async {
    try {
      // 1. Generate unique filename
      final fileName =
          '${DateTime.now().millisecondsSinceEpoch}_${path.basename(videoFile.path)}';
      final storageRef = _storage.ref().child('videos/$userId/$fileName');

      // 2. Start the upload
      final uploadTask = storageRef.putFile(
        videoFile,
        SettableMetadata(contentType: 'video/mp4'),
      );

      // 3. Listen to upload progress
      uploadTask.snapshotEvents.listen((snapshot) {
        if (snapshot.totalBytes > 0) {
          final progress = snapshot.bytesTransferred / snapshot.totalBytes;
          onProgress(progress);
        }
      });

      // 4. Wait for upload to complete safely
      final _ = await uploadTask.whenComplete(() => {});
      final videoUrl = await _.ref.getDownloadURL();

      // 5. Prepare Firestore metadata
      final videoData = {
        'userId': userId,
        'videoUrl': videoUrl,
        'thumbnailUrl': '', // Add later if using video_thumbnail
        'caption': caption,
        'createdAt': FieldValue.serverTimestamp(),
        'likes': 0,
      };

      // 6. Save metadata to Firestore
      final docRef = await _firestore.collection('videos').add(videoData);

      return docRef.id;
    } catch (e, s) {
      print('Upload failed: $e');
      print('Stack trace: $s');
      throw Exception('Failed to upload video: $e');
    }
  }

  Stream<QuerySnapshot> getVideos() {
    return _firestore
        .collection('videos')
        .orderBy('createdAt', descending: true)
        .snapshots();
  }
}
