class Sach{
  String _maSach;
  String _tenSach;
  String _tenTG;
  bool _trangThai = false;

  Sach(this._maSach, this._tenSach, this._tenTG, this._trangThai);

  String get maSach => _maSach;
  String get tenSach => _tenSach;
  String get tenTG => _tenTG;
  bool get trangThai => _trangThai;

  set maSach(String maSach){
    if(maSach.isNotEmpty){
      maSach = _maSach;
    }
  }

  set tenSach(String tenSach){
    if(tenSach.isNotEmpty){
      tenSach = _tenSach;
    }
  }

  set tenTG(String tenTG){
    if(tenTG.isNotEmpty){
      tenTG = _tenTG;
    }
  }

  set trangThai(bool trangThai){
    trangThai = _trangThai;
  }

void HienThiTT(){
  print('Mã sách: $_maSach');
  print('Tên sách: $_tenSach');
  print('Tên tác giả: $_tenTG');
  print('Trạng thái mượn: ${_trangThai ? 'Đã mượn' : 'Chưa mượn' }'); 
}
}