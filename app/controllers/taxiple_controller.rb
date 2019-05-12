class TaxipleController < ApplicationController
   before_action :authenticate_user!, except: [:index, :intro, :room_page, :menual, :view, :mobile_intro] #로그인한 유저만 등록 가능하게함.

  def room_page
  end
  
  def menual
  end
  
  def mobile_intro
    render layout: "view_layout"
  end
  
  def view
    render layout: "view_layout"
  end
  
  def create #방만들기
    if current_user.mk_room_id.nil? #현재유저가 방을 처음 만들 경우
      flash[:notice] = '방을 만드셨습니다.'
      @mkroom = MkRoom.create(user_id: current_user.id,
                    course: params[:course],
                    user_hour: params[:user_hour].to_i,
                    user_minute: params[:user_minute].to_i,
                    num_member_limit: params[:num_member_limit].to_i,
                    girl_only: params[:girl_only].to_i,
                    univ_id: current_user.univ_id)
      
      
      @list = List.create(mk_room_id: @mkroom.id,
                          person_1: current_user.email,
                          person_2: nil,
                          person_3: nil,
                          person_4: nil)
      
      current_user.update(mk_room_id: @mkroom.id,
                          list_id: @list.id,
                          register_to_use: true)
        
      redirect_to '/taxiple/my_room'
      
    else #현재유저가 방을 다시 만들경우, 뒤로가기 버튼 클릭시
      flash[:notice] = '방을 만드셨습니다.'
      current_user.mk_room.update(
                    course: params[:course],
                    user_hour: params[:user_hour].to_i,
                    user_minute: params[:user_minute].to_i,
                    num_member_limit: params[:num_member_limit].to_i,
                    girl_only: params[:girl_only].to_i)
      
      
      current_user.list.update(mk_room_id: current_user.mk_room.id,
                          person_1: current_user.email,
                          person_2: nil,
                          person_3: nil,
                          person_4: nil)
      
      current_user.update(mk_room_id: current_user.mk_room.id,
                          list_id: current_user.list.id)
        
      redirect_to '/taxiple/my_room'
    end
  end
  
  def page4 #인원 긊구 순으로 정렬
    flash[:notice] = '인원순으로 방을 정렬했습니다.'
    
    Time.zone = 'Seoul'
    @time = Time.zone.now
    @t = @time.day * 24 * 60 + @time.hour * 60 + @time.min
    
    
    @mkroom = MkRoom.all  
    @user = User.all
    @list = List.all
    @now_list = List.where(person_1: current_user.email) #현재 유저의 방정보는 person_1~4로 찾아야한다.
    
    #입력창에서 방장 / 참가자 / 구경꾼에 따라 보여주는 화면 설정
    if !@list.where(person_2: current_user.email).empty?
      @list_mkroom_id =  @list.where(person_2: current_user.email).take.mk_room_id
    elsif !@list.where(person_3: current_user.email).empty?
      @list_mkroom_id =  @list.where(person_3: current_user.email).take.mk_room_id
    elsif !@list.where(person_4: current_user.email).empty?
      #@list.where(person_4: current_user.email).each do |list|
      #  @list_mkroom_id = list.mk_room_id
      @list_mkroom_id =  @list.where(person_4: current_user.email).take.mk_room_id
      #end
    end
    render layout: "materialize"
  end
  
  def page4_time
    flash[:notice] = '시간순으로 방을 정렬했습니다.'
  
    Time.zone = 'Seoul'
    @time = Time.zone.now
    @t = @time.day * 24 * 60 + @time.hour * 60 + @time.min
    
     #현재 시간 설정  for 비교
    @time_hour = @time.hour.to_i * 60
    @now_time_compare = @time_hour + @time.min.to_i
    #유저가 입력한 시간 설정 for 비교는 page4_time 페이지 자체에 있음
    
    @mkroom = MkRoom.all
    @user = User.all
    @list = List.all
    
    render layout: "materialize"
  end
  
  def page4_routes
    @a = params[:univ_route]
    flash[:notice] = "'#{@a}' 경로의 방들만 보여줍니다."
    
    Time.zone = 'Seoul'
    @time = Time.zone.now
    @t = @time.day * 24 * 60 + @time.hour * 60 + @time.min
    
    
    render layout: "materialize"
  end
  
  
  def join  #참여자가 참여하기 버튼 클릭시
    MkRoom.where(id: params[:room_num].to_i).each do |mkroom|
      if current_user.univ_id == mkroom.univ_id #같은 univ_id만 참가 할 수 있게
        if mkroom.num_of_user_join >= mkroom.num_member_limit && current_user.mk_room.empty?
          mkroom.finish = true
          flash[:notice] = '방에 참여하지 못했습니다. 다른방을 골라주세요.'
        else
          mkroom.num_of_user_join += 1
          flash[:notice] = '방에 참여했습니다.'
        end
        mkroom.save
        if mkroom.finish == false
          List.where(mk_room_id: params[:room_num].to_i).each do |list| #person_# 중에 빈곳에 저장하기 위해
            if list.person_2.nil? #person_2안에 값이 비었냐
              list.person_2 = current_user.email
              list.save
            elsif list.person_2 != current_user && list.person_3.nil? #person_2에 값이 현재 유저가 아니냐 && person_3이 비었냐
              list.person_3 = current_user.email
              list.save
            elsif list.person_3 != current_user && list.person_4.nil? #person_3에 값이 현재 유저냐 && person_4가 비었냐
              list.person_4 = current_user.email
              list.save
            end
          end
          current_user.mk_room_id = params[:room_num]
          current_user.list_id = params[:room_num]## update 안써도 되나???
          current_user.register_to_use = true
          current_user.save
        end
      end
    end
    redirect_to "/taxiple/my_room"
  end
  
  # def join  #참여자가 참여하기 버튼 클릭시
  #   MkRoom.where(id: params[:room_num].to_i).each do |mkroom|
  #   # if current_user.univ_id == mkroom.univ_id #같은 univ_id만 참가 할 수 있게
  #     if mkroom.num_of_user_join >= mkroom.num_member_limit #&& current_user.mk_room.empty?
  #       mkroom.finish = true
  #       flash[:notice] = '방에 참여하지 못했습니다. 다른방을 골라주세요.'
  #       redirect_to "/taxiple/page4"
  #     else
  #       mkroom.num_of_user_join += 1
  #       mkroom.save
  #       flash[:notice] = '방에 참여했습니다.'
  #       List.where(mk_room_id: params[:room_num].to_i).each do |list| #person_# 중에 빈곳에 저장하기 위해
  #         if list.person_2.nil? #person_2안에 값이 비었냐
  #           list.person_2 = current_user.email
  #           list.save
  #         elsif list.person_2 != current_user && list.person_3.nil? #person_2에 값이 현재 유저가 아니냐 && person_3이 비었냐
  #           list.person_3 = current_user.email
  #           list.save
  #         elsif list.person_3 != current_user && list.person_4.nil? #person_3에 값이 현재 유저냐 && person_4가 비었냐
  #           list.person_4 = current_user.email
  #           list.save
  #         end
  #       end 
  #     end
  #       # if mkroom.finish == false
  #         # List.where(mk_room_id: params[:room_num].to_i).each do |list| #person_# 중에 빈곳에 저장하기 위해
  #         #   if list.person_2.nil? #person_2안에 값이 비었냐
  #         #     list.person_2 = current_user.email
  #         #     list.save
  #         #   elsif list.person_2 != current_user && list.person_3.nil? #person_2에 값이 현재 유저가 아니냐 && person_3이 비었냐
  #         #     list.person_3 = current_user.email
  #         #     list.save
  #         #   elsif list.person_3 != current_user && list.person_4.nil? #person_3에 값이 현재 유저냐 && person_4가 비었냐
  #         #     list.person_4 = current_user.email
  #         #     list.save
  #         #   end
  #       # end
  #     current_user.mk_room_id = params[:room_num].to_i
  #     current_user.list_id = params[:room_num].to_i## update 안써도 되나???
  #     current_user.register_to_use = true
  #     current_user.save
  #       # end
  #     # end
  #   end 
  #   redirect_to "/taxiple/my_room" 
  # end
  
  def delete #방장이 방 나갔을 때 ------------ 현재 다 getout으로 만들었기 때문에 필요는 없는 상태 11.2
    if true
      flash[:notice] = '방을 나갔습니다.'
    end
    #정보를 계속 가지고 있기 위해 List는 지우지 않는다 MkRoom은 그 정보로 방을 page4에서 출력하기 때문에 남겨둔다
    # current_user.list.destroy
    current_user.mk_room.destroy
    User.where(:email => [current_user.list.person_1, current_user.list.person_2, current_user.list.person_3, current_user.list.person_4]).each do |x|
        x.register_to_use = false
        x.mk_room_id = nil
        x.list_id = nil
        x.save
    end    
    redirect_to "/taxiple/page4"
  end
  
  def getout #참가했던 유저가 방을 나갔을 때
#방을 나가는 유저의 LIst데이터 초기화
    if current_user.list.person_2 == current_user.email
      current_user.list.update(person_2: nil)
    elsif current_user.list.person_3 == current_user.email
      current_user.list.update(person_3: nil)
    else
      current_user.list.update(person_4: nil)
    end
#방을 나가는 유저의 MkRoom데이터 초기화
    current_user.mk_room.num_of_user_join -= 1
    
    current_user.mk_room.save
    if current_user.mk_room.num_of_user_join == current_user.mk_room.num_member_limit
      current_user.mk_room.update(finish: false)
    end
    if current_user.mk_room.num_of_user_join == 0
      current_user.mk_room.destroy
    end
#유저의 User데이터 초기화
    current_user.register_to_use = false
    current_user.mk_room_id = nil
    current_user.list_id = nil
    current_user.save
   
    flash[:notice] = '방을 나갔습니다.'
    redirect_to "/taxiple/page4"
  end
  
  def make_room
    #시간 설정 
    Time.zone = 'Seoul'
    @time = Time.zone.now
    @time_hour = @time.hour 
    @hour_compare = @time_hour
    @mkroom = MkRoom.all
    if @time.min % 5 > 0
      @time_minute = @time.min / 5 * 5 + 5
    else
      @time_minute = @time.min / 5 * 5
    end
    
    @minu = 0
    
    @user = User.all
    @list = List.all
    #입력창에서 방장 / 참가자 / 구경꾼에 따라 보여주는 화면 설정
    
    render layout: "materialize"
  end
  
  def my_room
    Time.zone = 'Seoul'
    @time = Time.zone.now
    @t = @time.day * 24 * 60 + @time.hour * 60 + @time.min
    
    @a = params[:id]
    @mkroom = MkRoom.all
    @user = User.all
    @list = List.all
    @chat = Chat.all
    
    render layout: "materialize"
  end
  
  def write_chat
       #pusher
    Pusher['onlyone'].trigger('new_message', {
      msg: params[:content],
      some_student_name: params[:some_student_name]
      #,
      # student_name_2: current_user.list.person_2.user.mk_room.user.student_name,
      # student_name_3: current_user.list.person_2.user.mk_room.user.student_name,
      # student_name_4: current_user.list.person_2.user.mk_room.user.student_name
      
    })
    @chat = Chat.create(user_chat: params[:content],
                        user_id: current_user.id,
                        list_id: current_user.list_id )
    
    @name = current_user.student_name
    
    render :text => ""
  end
  def numbering_page
    render :layout => false
  end
end
