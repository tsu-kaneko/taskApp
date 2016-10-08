class ProjectsController < ApplicationController
  # indexアクションの作成
  #Projectはmodelの名前

  # 重複処理の共通化
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  def index
    # @はviewでそのまま使える
    # .allですべてのプロジェクト取得
    @projects = Project.all
  end

  def show
  end

  def new
    @project = Project.new
  end

  # project_newメソッドでパラメータ取得
  def create
    @project = Project.new(project_params)
    # 値が入ってたら保存、入ってなかったらnewに戻す
    if @project.save
      redirect_to projects_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @project.update(project_params)
      redirect_to projects_path
    else
      render 'edit'
    end
  end

  def destroy
    @project.destroy
    redirect_to projects_path
  end

  private
    # projectの中のtitleを取得
    # パラメータのフィルタリング
    def project_params
      params[:project].permit(:title)
    end

    def set_project
      @project = Project.find(params[:id])
    end

end
