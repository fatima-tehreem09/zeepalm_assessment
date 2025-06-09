class Article {
  final String tag;
  final String title;
  final String statement;
  final String imageUrl;
  final String writerName;
  final String writerImage;
  final String date;

  Article({
    required this.tag,
    required this.title,
    required this.statement,
    required this.imageUrl,
    required this.writerName,
    required this.writerImage,
    required this.date,
  });
}

final List<Article> articles = [
  Article(
    tag: "Lifestyle",
    title: "Curated Experiences: The New Luxury",
    statement:
        "How personalized, meaningful experiences are redefining luxury in the modern age.",
    imageUrl:
        "https://images.unsplash.com/photo-1747491681738-d0ed9a30fed3?q=80&w=1374&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    writerName: "Michael Chen",
    writerImage:
        "https://images.unsplash.com/photo-1748682170760-aba4b59da534?q=80&w=1374&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    date: "April 3, 2023",
  ),
  Article(
    tag: "Travel",
    title: "Escape to Nature: Top Eco Resorts of 2025",
    statement:
        "Discover the most beautiful and sustainable eco-resorts around the globe.",
    imageUrl:
        "https://images.unsplash.com/photo-1742367539759-6e4fc2e39209?q=80&w=1632&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    writerName: "Sophia Li",
    writerImage:
        "https://images.unsplash.com/photo-1748190728356-e8e06e021640?q=80&w=1528&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    date: "May 20, 2025",
  ),
  Article(
    tag: "Wellness",
    title: "Mindful Mornings: Rituals That Elevate Your Day",
    statement:
        "Start your mornings with intention and mindfulness for a more productive life.",
    imageUrl:
        "https://images.unsplash.com/photo-1748679767437-00b5c0327b1a?q=80&w=1427&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    writerName: "Arjun Mehta",
    writerImage:
        "https://images.unsplash.com/photo-1747990927764-ae2bc17a008d?q=80&w=1474&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    date: "January 15, 2025",
  ),
  Article(
    tag: "Fashion",
    title: "Sustainable Fashion: A Movement, Not a Trend",
    statement:
        "Explore how conscious clothing choices are shaping the future of fashion.",
    imageUrl:
        "https://images.unsplash.com/photo-1748190728356-e8e06e021640?q=80&w=1528&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    writerName: "Emily Nguyen",
    writerImage:
        "https://images.unsplash.com/photo-1748682170760-aba4b59da534?q=80&w=1374&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    date: "March 8, 2025",
  ),
  Article(
    tag: "Tech",
    title: "The Rise of Smart Living Spaces",
    statement:
        "How AI and IoT are revolutionizing the way we live and interact with our homes.",
    imageUrl:
        "https://images.unsplash.com/photo-1747990927764-ae2bc17a008d?q=80&w=1474&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    writerName: "Lucas Martin",
    writerImage:
        "https://images.unsplash.com/photo-1748682170760-aba4b59da534?q=80&w=1374&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    date: "February 26, 2025",
  ),
];
