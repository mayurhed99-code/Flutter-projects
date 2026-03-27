class StudentProfile {
  final String name;
  final String rollNo;
  final String semester;
  final String branch;
  final String email;
  final String phone;
  final String photoUrl;

  const StudentProfile({
    required this.name,
    required this.rollNo,
    required this.semester,
    required this.branch,
    required this.email,
    required this.phone,
    required this.photoUrl,
  });

  StudentProfile copyWith({
    String? name,
    String? rollNo,
    String? semester,
    String? branch,
    String? email,
    String? phone,
    String? photoUrl,
  }) {
    return StudentProfile(
      name: name ?? this.name,
      rollNo: rollNo ?? this.rollNo,
      semester: semester ?? this.semester,
      branch: branch ?? this.branch,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      photoUrl: photoUrl ?? this.photoUrl,
    );
  }
}
