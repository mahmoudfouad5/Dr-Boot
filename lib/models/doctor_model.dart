

class DoctorData{

  String? name;
  int? age;
  String? info;
  String? photo;
    DoctorData({
    this.age,
   this.name,
   this.info,
   this.photo,
   });
 DoctorData.fromJson(Map<String,dynamic>json)
 {
   age=json['age'];
   name=json['name'];
   info=json['info'];
   info=json['photo'];
    }
 Map<String,dynamic>toMap(){
   return
       {
         'name':name,
         'age':age,
         'info':info,
         'photo':photo,
          };

 }
}