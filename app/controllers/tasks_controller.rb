class TasksController < ApplicationController
  #全てセット系
  before_action :set_task_show, only: [:index, :create, :show]
  before_action :set_task, only: [:edit, :update, :destroy]
  before_action :set_task_new, only: [:index, :new]


  def index
      punishment  # 罰の投稿を作成する
      @tasks = Task.where(user_id:@current_user.following_ids).where(public:"true").or(Task.where(user_id: "#{@current_user.id}"))# タスクにパブリックとフォローしてる人のタスクを代入
       # 罰の投稿も追加 
      task_all = Task.all
      task_all.each do |task|
        has_task = User.find_by(id:task.notice_id)
        if task.notice_id.to_i > 0 && @current_user.following?(has_task)
          @tasks += [task]  
        elsif task.notice_id == @current_user.id
          @tasks += [task]    
        end
      end
  end

  def new
  end

  def create #todo追加
    @tasks = Task.where(public:"true")
    @task = Task.new(task_params)
    @task.user_id = @current_user.id
    if @task.save
      redirect_to tasks_path
    else
      render :index
    end
  end

  def edit
  end


  def show
    @tasks = Task.where(public:"true")
  end


  def update
    @task.update(task_params)
    redirect_to tasks_url
  end

  def destroy
    @task.destroy
    total_count_and_twi(@task)
    notice_check(@task)
    redirect_to "/users/#{@task.user_id}/show"
  end


  private
    def task_params #ストロング
      params.require(:task).permit(:task,:limit_date,:priority,:public)
    end

    #セット系
    def set_task_show
      @tasks_show  = Task.where(user_id: "#{@current_user.id}").order(priority: "ASC")
    end

    def set_task
      @task = Task.find(params[:id])
    end

    def set_task_new
      @task = Task.new
    end

    def total_count_and_twi(this_task)
      user_id = this_task.user_id
      user = User.find_by(id: user_id)
      user.done_total = user.done_total.to_i + 1
      if user.done_total % 5 == 0
        task = Task.new(task: "#{user.name}さんが累計#{user.done_total}件のタスクを終わらせました！すごいね！！", public: "true")
      task.save
      end
      user.save
    end

    def punishment
      @user_tasks = Task.where(user_id: @current_user.id)
      count = 0
      @user_tasks.each do |task|
        count += 1 if task.limit_date < Date.today
      end
      if count > 0
        notice = Task.new(task: "#{@current_user.name}さんが累計#{count}件のタスクを先延ばししています。早くやれ！！！", public: "true", notice_id:"#{@current_user.id}")
        notice.save
      end
     end

     def notice_check(task)
       #destroy時に発火させる
       if task.limit_date < Date.today  #消したのが超過してるか確認する
         notices = Task.where(notice_id:"#{@current_user.id}") #  タスクからnotice_idで今のユーザーのnotice引っ張ってくる
         notices.each do |notice|
          notice.destroy
         end # 上を消す
       end
      #  この文じゃなくて、indexにリダイレクトした時に、もう一度punishmentが動いて最新の
      #  超過情報がタイムライに乗る
     end
end
