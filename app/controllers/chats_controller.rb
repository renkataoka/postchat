class ChatsController < ApplicationController
  before_action :set_chat,only: [:show, :edit, :update, :destroy]

  def index
    @chats = Chat.all
  end

  def new
    if params[:back]
      @chat = Chat.new(chat_params)
    else
      @chat = Chat.new
    end
  end

  def create
    @chat = Chat.new(chat_params)
    if @chat.save
      redirect_to chats_path, notice:"チャットを投稿しました。"
    else
      render 'new'
    end
  end

  def confirm
    @chat = Chat.new(chat_params)
    render :new if @chat.invalid?
  end

  def show
  end

  def edit
  end

  def update
    if @chat.update(chat_params)
      redirect_to chats_path, notice:"チャットを編集しました。"
    else
      render 'edit'
    end
  end

  def destroy
    @chat.destroy
    redirect_to chats_path, notice:"チャットを削除しました！"
  end

  private

  def chat_params
    params.require(:chat).permit(:content)
  end

  def set_chat
    @chat = Chat.find(params[:id])
  end
end
