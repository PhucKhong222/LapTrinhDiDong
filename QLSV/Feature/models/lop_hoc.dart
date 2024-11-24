import 'sinh_vien.dart';


class LopHoc{
  String _tenLop;
  List<SinhVien> _danhSachSV = [];

  LopHoc(this._tenLop);
  
  //Getter
  String get tenLop => _tenLop;
  List<SinhVien> get danhSachSV => _danhSachSV;

  set tenLop (String tenLop){
    if(tenLop.isNotEmpty){
      _tenLop = tenLop;
    }
  }

  void themSinhVien(SinhVien SV) => _danhSachSV.add(SV);
  // {
  //   _danhSachSV.add(SV);
  // }

  void HienThiDS(){
    print('Danh sách sinh viên lớp $_tenLop');
    for(var SV in _danhSachSV){
      print('-------------------------------');
      SV.HienThiTT();
      print('Xếp loại: ${SV.XepLoai()}');
      print('-------------------------------');

    }
  }
}