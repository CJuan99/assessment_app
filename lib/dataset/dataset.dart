class Contact {
  final String user;
  final String phone;
  final String checkIn;

  Contact({this.user, this.phone, this.checkIn});
}

var time = contact.map((contact) => contact.checkIn).toList();

final List<Contact> contact = [
  Contact(
      user: 'Chan Saw Lin',
      phone: '0152131113',
      checkIn: '2020-06-30 16:10:05'),
  Contact(
      user: 'Lee Saw Loy',
      phone: '01161231346',
      checkIn: '2020-07-11 15:39:59'),
  Contact(
      user: 'Khaw Tong Lin',
      phone: '0158398109',
      checkIn: '2020-08-19 11:10:18'),
  Contact(
      user: 'Lim Kok Lin', phone: '0168279101', checkIn: '2020-08-19 11:11:35'),
  Contact(
      user: 'Low Jun Wei', phone: '0112731912', checkIn: '2020-08-15 13:00:05'),
  Contact(
      user: 'Yong Weng Kai',
      phone: '0172332743',
      checkIn: '2020-07-31 18:10:11'),
  Contact(
      user: 'Jayden Lee', phone: '0191236439', checkIn: '2020-08-22 08:10:38'),
  Contact(
      user: 'Kong Kah Yan',
      phone: '0111931233',
      checkIn: '2020-07-11 12:00:00'),
  Contact(
      user: 'Jasmine Lau', phone: '0162879190', checkIn: '2020-08-01 12:10:05'),
  Contact(
      user: 'Chan Saw Lin', phone: '016783239', checkIn: '2020-08-23 11:59:05'),
];
