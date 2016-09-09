contract Experiment {
  struct CommunityObj {
    string addr; //小区地址 主键
    string cname; //小区名字
    uint16 tree_num; //小区树的数量

    mapping(uint8 => BuildingObj) buildingDB;
  }

  struct BuildingObj {
    uint8 tablet; //楼号 主键
    uint8 floor; //层数
  }

  mapping(string => CommunityObj) communityDB;

  //输入信息
  function addinfo(string addr,string cname, uint16 tree_num,uint8 tablet,uint8 floor){

    CommunityObj community = communityDB[addr];
    community.addr = addr;
    community.cname = cname;
    community.tree_num = tree_num;
    community.buildingDB[tablet].tablet = tablet;
    community.buildingDB[tablet].floor = floor;
  }

  //读取信息
  function getinfo(string addr, uint8 _tablet) constant returns(string cname,uint16 tree_num,uint8 tablet,uint8 floor){
    CommunityObj community = communityDB[addr];
    cname = community.cname;
    tree_num = community.tree_num;
    tablet = community.buildingDB[_tablet].tablet;
    floor = community.buildingDB[_tablet].floor;
  }
}
