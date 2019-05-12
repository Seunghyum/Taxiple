# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# user = User.create!  :email => '32141620@dankook.ac.kr', :password => '12341234', :password_confirmation => '12341234'


#등교 :uni_route_1~3
#하교 :uni_route_4~6로 되어있다. 

#강원대 1
univ = Univ.create! :uni_email => '@kangwon.ac.kr', :uni_route_1 => '춘천시외버스터미널 -> 연적지', :uni_route_2 => '춘천역 -> 연적지', :uni_route_4 => '연적지 -> 춘천시외버스터미널', :uni_route_5 => '연적지 -> 춘천역', :uni_name => '강원대'
#경북대 2
univ = Univ.create! :uni_email => '@knu.ac.kr', :uni_route_1 => '동대구역 -> 경북대 본관', :uni_route_4 => '경북대 본관 -> 동대구역', :uni_name => '경북대'
#경희대 3
univ = Univ.create! :uni_email => '@khu.ac.kr', :uni_route_1 => '회기역 -> 노천극장', :uni_route_4 => '노천극장 -> 회기역', :uni_name => '경희대'
#고려대 4
univ = Univ.create! :uni_email => '@korea.ac.kr', :uni_route_1 => '청량리역 -> 고려대 정문', :uni_route_4 => '고려대 정문 -> 청량리역', :uni_name => '고려대'
#국민대 5
univ = Univ.create! :uni_email => '@kookmin.ac.kr', :uni_route_1 => '길음역 -> 국민대 정문', :uni_route_4 => '국민대 정문 -> 길음역', :uni_name => '국민대'
#단국대 죽전캠 6
univ = Univ.create! :uni_email => '@dankook.ac.kr', :uni_route_1 => '죽전역 -> 단국대 곰상', :uni_route_4 => '단국대 정문 -> 죽전역', :uni_name => '단국대 죽전'
#단국대 천안캠 7
univ = Univ.create! :uni_email => '@dankook.ac.kr', :uni_route_1 => '두정역 -> 택시 승강장', :uni_route_2 => '종합터미널 -> 택시 승강장', :uni_route_4 => '택시 승강장 -> 두정역', :uni_route_5 => '택시 승강장 -> 종합터미널', :campus => true, :uni_name => '단국대 천안'
#덕성여대 8
univ = Univ.create! :uni_email => '@duksung.ac.kr', :uni_route_1 => '수유역 -> 학생회관', :uni_route_4 => '학생회관 -> 수유역', :uni_name => '덕성여대'
#부산대 9
univ = Univ.create! :uni_email => '@pusan.ac.kr', :uni_route_1 => '부산대역 -> 제1도서관', :uni_route_4 => '제1도서관 -> 부산대역', :uni_name => '부산대'
#서울과학기술대 10
univ = Univ.create! :uni_email => '@seoultech.ac.kr', :uni_route_1 => '공릉역 -> 백주년 기념관', :uni_route_4 => '백주년 기념관 -> 공릉역', :uni_name => '서울과학기술대'
#서울대 11
univ = Univ.create! :uni_email => '@snu.ac.kr', :uni_route_1 => '서울대 입구역 3번 출구 -> 행정관', :uni_route_2 => '낙성대역 4번 출구 -> 기숙사 삼거리', :uni_route_4 => '행정관 -> 서울대 입구역', :uni_route_5 => '기숙사 삼거리 -> 낙성대역', :uni_name => '서울대'
#서울시립대  12
univ = Univ.create! :uni_email => '@uos.ac.kr', :uni_route_1 => '청량리역 4번 출구 -> 본관', :uni_route_4 => '본관 -> 청량리역', :uni_name => '서울시립대'
#서울여대 13
univ = Univ.create! :uni_email => '@swu.ac.kr', :uni_route_1 => '태릉입구역 7번 출구 -> 서울여대 대강당', :uni_route_2 => '화랑대역 1번 출구 -> 서울여대 대강당', :uni_route_4 => '서울여대 정문 -> 화랑대역', :uni_route_5 => '서울여대 정문 -> 태릉입구역', :uni_name => '서울여대'
#성균관대 14
univ = Univ.create! :uni_email => '@skku.edu', :uni_route_1 => '혜화역 1번 출구 -> 호암관', :uni_route_4 => '호암관 -> 혜화역', :uni_name => '성균관대'
#성신여대 15
univ = Univ.create! :uni_email => '@sungsin.ac.kr', :uni_route_1 => '성신여대역 1번 출구 -> 중문', :uni_route_4 => '중문 -> 성신여대역', :uni_name => '성신여대'
#숙명여대 16
univ = Univ.create! :uni_email => '@sookmyung.ac.kr', :uni_route_1 => '숙대입구역 10번 출구 -> 후문', :uni_route_2 => '서울역 -> 후문', :uni_name => '숙명여대'
#아주대 17
univ = Univ.create! :uni_email => '@ajou.ac.kr', :uni_route_1 => '수원시청역 9번 출구 -> 학생회관', :uni_route_2 => '수원역 9번 출구 -> 학생회관', :uni_route_4 => '정문 -> 수원시청역', :uni_route_5 => '정문 -> 수원역', :uni_name => '아주대'
#연세대 18
univ = Univ.create! :uni_email => '@yonsei.ac.kr', :uni_route_1 => '경복궁역 4번 출구 -> 성암관', :uni_route_2 => '신촌역 2호선 3번 출구 -> 성암관', :uni_route_4 => '정문 -> 경복궁역 4번 출구', :uni_route_5 => '정문 -> 신촌역 2호선 3번 출구', :uni_name => '연세대'
#영남대 19
univ = Univ.create! :uni_email => '@ynu.ac.kr', :uni_route_1 => '경산역 -> 중앙도서관', :uni_route_2 => '경산시외버스터미널 -> 중앙도서관', :uni_route_4 => '영남대 정문 -> 경산역', :uni_route_5 => '영남대 정문 -> 경산시외버스터미널', :uni_name => '영남대'
#울산과학기술대(UNIST) 20
univ = Univ.create! :uni_email => '@unist.ac.kr', :uni_route_1 => '울산역 -> Unist학생회관', :uni_route_4 => 'Unist학생회관 -> 울산역', :uni_name => '울산과학기술대'
#원광대 21
univ = Univ.create! :uni_email => '@wku.ac.kr', :uni_route_1 => '익산역 -> 학생회관', :uni_route_2 => '익산고속버스터미널 -> 학생회관', :uni_route_4 => '학생회관 -> 익산역', :uni_route_5 => '학생회관 -> 익산고속버스터미널', :uni_name => '원광대'
#이화여대 22
univ = Univ.create! :uni_email => '@ehwa.ac.kr', :uni_route_1 => '이화여대 2호선 3번 출구 -> 학관', :uni_route_2 => '서울역 -> 이화여대 정문', :uni_route_4 => '학관 -> 이화여대 2호선', :uni_route_5 => '이화여대 정문 -> 서울역', :uni_name => '이화여대'
#인하대 23
univ = Univ.create! :uni_email => '@inha.ac.kr', :uni_route_1 => '제물포역 1번 출구 -> 본관', :uni_route_2 => '인천종합터미널 4번 출구 -> 본관', :uni_route_4 => '본관 -> 제물포역', :uni_route_5 => '본관 -> 인천종합터미널', :uni_name => '인하대'
#전남대 24
univ = Univ.create! :uni_email => '@jnu.ac.kr', :uni_route_1 => '광주역 -> 5.18 연구소', :uni_route_2 => '광주종합버스터미널 -> 5.18연구소', :uni_route_4 => '정문 -> 광주역', :uni_route_5 => '정문 -> 광주종합버스터미널', :uni_name => '전남대'
#중앙대 25
univ = Univ.create! :uni_email => '@cau.ac.kr', :uni_route_1 => '흑석역 4번 출구 -> 중앙도서관', :uni_route_2 => '상도역 5번 출구 -> 중앙도서관', :uni_route_4 => '정문 -> 흑석역', :uni_route_5 => '정문 -> 상도역', :uni_name => '중앙대'
#충남대 26
univ = Univ.create! :uni_email => '@cnu.ac.kr', :uni_route_1 => '유성온천역 7번 출구 -> 제2학생회관', :uni_route_2 => '유성금호고속터미널 -> 제2학생회관', :uni_route_3 => '유성시외버스정류소 -> 제2학생회관', :uni_route_4 => '정문 -> 유성온천역 7번 출구', :uni_route_5 => '정문 -> 유성금호고속터미널', :uni_route_6 => '정문 -> 유성시외버스정류소', :uni_name => '충남대'
#평택대 27
univ = Univ.create! :uni_email => '@ptu.ac.kr', :uni_route_1 => '평택역 -> 100주년 기념탑', :uni_route_2 => '평택공용버스터미널 -> 100주년 기념탑', :uni_route_4 => '정문 -> 평택역', :uni_route_5 => '정문 -> 평택고용버스터미널', :uni_name => '평택대'
#한국과학기술원(KAIST) 28
univ = Univ.create! :uni_email => '@kaist.ac.kr', :uni_route_1 => '월평역 3번 출구 -> 본관', :uni_route_2 => '유성금호고속터미널 -> 본관', :uni_route_3 => '유성시외버스정류소 -> 본관', :uni_route_4 => '정문 -> 월평역', :uni_route_5 => '정문 -> 유성금호고속터미널', :uni_route_6 => '정문 -> 유성시외버스정류소', :uni_name => '한국과학기술원'
#한동대 29
univ = Univ.create! :uni_email => '@handong.edu', :uni_route_1 => '포항역 -> 정문', :uni_route_4 => '정문 -> 포항역', :uni_name => '한동대'

# user = User.create! :univ_id => 20, :register_to_use => false, :campus => false, :email => '32141620@ehwa.ac.kr', :encrypted_password => '12341234', :password => '12341234', :password_confirmation => '12341234', :created_at => "2015-09-24 14:44:45", :updated_at => "2015-09-30 17:50:05"
user = User.new(
       :univ_id              => 22,
      :email                 => "32141620@ehwa.ac.kr",
      :password              => "12341234",
      :password_confirmation => "12341234",
      :student_name          => "설리"
      
  )
user.skip_confirmation!
user.save!

user = User.new(
       :univ_id              => 22,
      :email                 => "12341234@ehwa.ac.kr",
      :password              => "12341234",
      :password_confirmation => "12341234",
      :student_name          => "보라"
      
  )
user.skip_confirmation!
user.save!
  
 
user = User.new(
      :univ_id              => 11,
      :email                 => "32141620@snu.ac.kr",
      :password              => "12341234",
      :password_confirmation => "12341234",
      :student_name          => "승현"
                )
user.skip_confirmation!
user.save!      

user = User.new(
      :univ_id              => 6,
      :email                 => "1@dankook.ac.kr",
      :password              => "12341234",
      :password_confirmation => "12341234",
      :student_name          => "1"   
                )
user.skip_confirmation!
user.save!

user = User.new(
      :univ_id              => 6,
      :email                 => "2@dankook.ac.kr",
      :password              => "12341234",
      :password_confirmation => "12341234",
      :student_name          => "2"
                )
user.skip_confirmation!
user.save!

user = User.new(
      :univ_id              => 6,
      :email                 => "3@dankook.ac.kr",
      :password              => "12341234",
      :password_confirmation => "12341234",
      :student_name          => "3"
                )
user.skip_confirmation!
user.save!

user = User.new(
      :univ_id              => 6,
      :email                 => "4@dankook.ac.kr",
      :password              => "12341234",
      :password_confirmation => "12341234",
      :student_name          => "4"
                )
user.skip_confirmation!
user.save!

user = User.new(
      :univ_id              => 6,
      :email                 => "5@dankook.ac.kr",
      :password              => "12341234",
      :password_confirmation => "12341234",
      :student_name          => "5"
                )
user.skip_confirmation!
user.save!

user = User.new(
      :univ_id              => 6,
      :email                 => "6@dankook.ac.kr",
      :password              => "12341234",
      :password_confirmation => "12341234",
      :student_name          => "6"
                )
user.skip_confirmation!
user.save!

user = User.new(
      :univ_id              => 6,
      :email                 => "7@dankook.ac.kr",
      :password              => "12341234",
      :password_confirmation => "12341234",
      :student_name          => "7"
                )
user.skip_confirmation!
user.save!
user = User.new(
      :univ_id              => 6,
      :email                 => "8@dankook.ac.kr",
      :password              => "12341234",
      :password_confirmation => "12341234",
      :student_name          => "8"
                )
user.skip_confirmation!
user.save!
#<User id: 1, list_id: 1, univ_id: 6, register_to_use: false, campus: false, email: "32141620@dankook.ac.kr", encrypted_password: "$2a$10$C/pbVDI.v3EGbonmF.xKw.0qdpUW54qQd8z7WMXLlPz...", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 7, current_sign_in_at: "2015-09-30 17:50:05", last_sign_in_at: "2015-09-30 17:20:53", current_sign_in_ip: "1.209.15.4", last_sign_in_ip: "1.209.15.4", confirmation_token: "56tVgxvxkQc1sAzFVcHo", confirmed_at: "2015-09-24 14:47:03", confirmation_sent_at: "2015-09-24 14:44:45", unconfirmed_email: nil, created_at: "2015-09-24 14:44:45", updated_at: "2015-09-30 17:50:05">
