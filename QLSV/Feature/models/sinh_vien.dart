

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




