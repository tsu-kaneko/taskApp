class ProjectsController < ApplicationController
  # index�A�N�V�����̍쐬
  #Project��model�̖��O

  # �d�������̋��ʉ�
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  def index
    # @��view�ł��̂܂܎g����
    # .all�ł��ׂẴv���W�F�N�g�擾
    @projects = Project.all
  end

  def show
  end

  def new
    @project = Project.new
  end

  # project_new���\�b�h�Ńp�����[�^�擾
  def create
    @project = Project.new(project_params)
    # �l�������Ă���ۑ��A�����ĂȂ�������new�ɖ߂�
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
    # project�̒���title���擾
    # �p�����[�^�̃t�B���^�����O
    def project_params
      params[:project].permit(:title)
    end

    def set_project
      @project = Project.find(params[:id])
    end

end
