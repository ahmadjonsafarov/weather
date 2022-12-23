class Universiyt{
  final String alpha_two_code;
  final String name;
  final List<String> web_pages;
  final String country;
  Universiyt({required this.alpha_two_code, required this.name, required this.web_pages, required this.country});
  factory Universiyt.fromJson(Map data){
    List<String> pages=[];
    data['web_page'].forEach((element){
      pages.add(element);
    });
    return Universiyt(
        alpha_two_code: data["alpha_two_code"],
        name: data['name'],
        web_pages: pages,
        country: data['country']);
  }
}