class Juso {
  final String? roadAddr;
  final String? roadAddrPart1;
  final String? roadAddrPart2;
  final String? jibunAddr;
  final String? engAddr;
  final String? zipNo;
  final String? admCd;
  final String? rnMgtSn;
  final String? bdMgtSn;
  final String? detBdNmList;
  final String? bdNm;
  final String? bdKdcd;
  final String? siNm;
  final String? sggNm;
  final String? emdNm;
  final String? liNm;
  final String? rn;
  final String? udrtYn;
  final String? mtYn;
  final String? emdNo;
  final String? hstryYn;
  final String? relJibun;
  final String? hemdNm;
  final String? buldMnnm;
  final String? buldSlno;
  final String? nbrMnnm;
  final String? lnbrSlno;
  Juso({
    this.roadAddr,
    this.roadAddrPart1,
    this.roadAddrPart2,
    this.jibunAddr,
    this.engAddr,
    this.zipNo,
    this.admCd,
    this.rnMgtSn,
    this.bdMgtSn,
    this.detBdNmList,
    this.bdNm,
    this.bdKdcd,
    this.siNm,
    this.sggNm,
    this.emdNm,
    this.liNm,
    this.rn,
    this.udrtYn,
    this.mtYn,
    this.emdNo,
    this.hstryYn,
    this.relJibun,
    this.hemdNm,
    this.buldMnnm,
    this.buldSlno,
    this.nbrMnnm,
    this.lnbrSlno,
  });

  factory Juso.empty(){
    return Juso(
      roadAddr: '',
      roadAddrPart1: '',
      roadAddrPart2: '',
      jibunAddr: '',
      engAddr : '',
      zipNo: '',
      admCd: '',
      rnMgtSn: '',
      bdMgtSn: '',
      detBdNmList: '',
      bdNm: '',
      bdKdcd: '',
      siNm: '',
      sggNm: '',
      emdNm: '',
      liNm: '',
      rn: '',
      udrtYn: '',
      mtYn: '',
      emdNo: '',
      hstryYn: '',
      relJibun: '',
      hemdNm: '',
      buldMnnm: '',
      buldSlno: '',
      nbrMnnm: '',
      lnbrSlno: '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'roadAddr': roadAddr,
      'roadAddrPart1': roadAddrPart1,
      'roadAddrPart2': roadAddrPart2,
      'jibunAddr': jibunAddr,
      'engAddr': engAddr,
      'zipNo': zipNo,
      'admCd': admCd,
      'rnMgtSn': rnMgtSn,
      'bdMgtSn': bdMgtSn,
      'detBdNmList': detBdNmList,
      'bdNm': bdNm,
      'bdKdcd': bdKdcd,
      'siNm': siNm,
      'sggNm': sggNm,
      'emdNm': emdNm,
      'liNm': liNm,
      'rn': rn,
      'udrtYn': udrtYn,
      'mtYn': mtYn,
      'emdNo': emdNo,
      'hstryYn': hstryYn,
      'relJibun': relJibun,
      'hemdNm': hemdNm,
      'buldMnnm': buldMnnm,
      'buldSlno': buldSlno,
      'nbrMnnm': nbrMnnm,
      'lnbrSlno': lnbrSlno,
    };
  }

  factory Juso.fromJson(Map<String, dynamic>? json) {
    return json == null 
      ? Juso.empty() 
      : Juso(
          roadAddr: json['roadAddr'] ?? '',
          roadAddrPart1: json['roadAddrPart1'] ?? '',
          roadAddrPart2: json['roadAddrPart2'] ?? '',
          jibunAddr: json['jibunAddr'] ?? '',
          engAddr: json['engAddr'] ?? '',
          zipNo: json['zipNo'] ?? '',
          admCd: json['admCd'] ?? '',
          rnMgtSn: json['rnMgtSn'] ?? '',
          bdMgtSn: json['bdMgtSn'] ?? '',
          detBdNmList: json['detBdNmList'] ?? '',
          bdNm: json['bdNm'] ?? '',
          bdKdcd: json['bdKdcd'] ?? '',
          siNm: json['siNm'] ?? '',
          sggNm: json['sggNm'] ?? '',
          emdNm: json['emdNm'] ?? '',
          liNm: json['liNm'] ?? '',
          rn: json['rn'] ?? '',
          udrtYn: json['udrtYn'] ?? '',
          mtYn: json['mtYn'] ?? '',
          emdNo: json['emdNo'] ?? '',
          hstryYn: json['hstryYn'] ?? '',
          relJibun: json['relJibun'] ?? '',
          hemdNm: json['hemdNm'] ?? '',
          buldMnnm: json['buldMnnm'] ?? '',
          buldSlno: json['buldSlno'] ?? '',
          nbrMnnm: json['nbrMnnm'] ?? '',
          lnbrSlno: json['lnbrSlno'] ?? '',
        );
  }
}

