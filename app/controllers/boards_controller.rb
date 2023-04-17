class BoardsController < ApplicationController
  def index
    @boards = Board.all
  end

  def new
    @board = Board.new
  end

  def show
    @board = Board.find(params[:id])
  end

  def edit
    @board = Board.find(params[:id])
  end

def create
  @board = Board.new(board_params)
  if @board.save
    redirect_to @board, notice: '掲示板が作成が成功しました。'
  else
    render :new
  end
end

# PATCH/PUT /boards/1
def update

  @board = Board.find(params[:id])

  if @board.update(board_params)
    redirect_to @board, notice: '掲示板が編集が成功しました。'
  else
    render :edit
  end
end
# DELETE /boards/1
def destroy
  @board = Board.find(params[:id])
  @board.destroy
  redirect_to boards_url, notice: '掲示板が削除が成功しました。'
end

private
  # Use callbacks to share common setup or constraints between actions.
  def set_board
    @board = Board.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def board_params
    params.require(:board).permit(:title, :body)
  end
end
