class SinhVien {
  String _hoTen;
  int _tuoi;
  String _MSSV;
  double _DTB;

  //constructor
  SinhVien(this._hoTen, this._tuoi, this._MSSV, this._DTB);

 //getter
  String get hoTen => _hoTen;
  int get tuoi => _tuoi;
  String get MSSV => _MSSV;
  double get DTB => _DTB;

  //setter
  set hoTen(String hoTen){
    if(hoTen.isNotEmpty){
      _hoTen = hoTen;
    }
  }

  set tuoi(int tuoi)
  {
    // if(tuoi > 0){
    //   _tuoi = tuoi;
    // }

    _tuoi = (tuoi > 0) ? tuoi:_tuoi;
  }

  set MSSV(String MSSV){
    if(MSSV.isNotEmpty){
      _MSSV = MSSV;
    }
  }

  set DTB(double DTB){
    if(DTB > 0 || DTB < 10){
      _DTB = DTB;
    }
  }

  //Hiển thị thông tin sinh viên
  void HienThiTT(){
    print('Họ tên: $_hoTen');
    print('Tuổi: $_tuoi');
    print('MSSV: $_MSSV');
    print('Điểm TB: $_DTB');
  }

  // Xếp loại học tập
  String XepLoai(){
    if(_DTB >= 8.0) return 'Giỏi';
    if(_DTB >= 6.5) return 'Khá';
    if(_DTB >= 5.0) return 'Trung Bình';
    return 'Yếu';
  }
}

// Class LopHoc

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

void main(){
    var SV = SinhVien('Nguyễn Văn A', 21, 'SV002', 9.0);
    print('Test getter: ${SV.hoTen}');
    SV._hoTen = 'Nguyễn Văn B';
    print('Sau khi set: ${SV.hoTen}');
    print('Xếp loại: ${SV.XepLoai()}');

    var lop = LopHoc('21DTHD5');
    lop.themSinhVien(SinhVien('Nguyễn Văn A', 21, 'SV002', 9.0));
    lop.themSinhVien(SinhVien('Nguyễn Văn B', 21, 'SV003', 7.0));
    lop.themSinhVien(SinhVien('Nguyễn Văn C', 21, 'SV004', 5.0));
    lop.themSinhVien(SinhVien('Nguyễn Văn D', 21, 'SV005', 4.0));
    lop.HienThiDS();
  }