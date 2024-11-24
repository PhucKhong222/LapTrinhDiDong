import 'Sach.dart';

class DocGia{
  String _maDocGia;
  String _hoTen;
  List<Sach> _danhSachMuon = [];

  DocGia(this._maDocGia, this._hoTen);

  String get maDocGia => _maDocGia;
  String get hoTen => _hoTen;
  List<Sach> get danhSachMuon => _danhSachMuon;

  set maDocGia(String maDocGia){
    if(maDocGia.isNotEmpty){
      maDocGia = _maDocGia;
    }
  }

  set hoTen(String hoTen){
    if(hoTen.isNotEmpty){
      hoTen = _hoTen;
    }
  }

  void MuonSach(Sach s){
    if(s.trangThai == false){
      s.trangThai = true;
      _danhSachMuon.add(s);
    }
    else
    print('Sách đã có người mượn');
  }

  void TraSach(Sach s){
    if(_danhSachMuon.contains(s)){
      s.trangThai = false;
      _danhSachMuon.remove(s);
    }
    else
    print('Sách không trong trạng thái mượn');
  }
}