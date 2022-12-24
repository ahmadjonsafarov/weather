class Universiyt{
  final String alpha_two_code;
  final String name;
  final List<String>? webPages;
  final String country;

  Universiyt({required this.webPages, required this.alpha_two_code, required this.name, required this.country});
  factory Universiyt.fromJson(Map data){
    List<String> pages=[];

    data['web_pages'].forEach((element){
      pages.add(element);
    });
    return Universiyt(
        alpha_two_code: data["alpha_two_code"],
        name: data['name'],
        country: data['country'],
        webPages: pages
    );
  }
}
 