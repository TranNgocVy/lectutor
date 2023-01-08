class Level{
  String id;
  String name;
  String alias;
  String key;

  Level(this.id, this.name, this.alias, this.key);

  static Level getLevelByKey(List<Level> list, String key){
    for(int i =0 ; i < list.length; i++){
      if(list[i].key == key){
        return list[i];
      }
    }

    return Level("", "", "", "");
  }
  static Level getLevelById(List<Level> list, String id){
    for(int i =0 ; i < list.length; i++){
      if(list[i].id == id){
        return list[i];
      }
    }

    return Level("", "", "", "");
  }
}