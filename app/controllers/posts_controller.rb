class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token
  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all
    @post =  Post.new
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.find_by(short_url: params[:short_url])
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create

    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Nice! Here is your shortlink:'}
        #format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        #format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end


  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update

    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Link updated!' }
        #format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        #format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Link deleted!' }
      #format.json { head :no_content }
    end
  end

  def send_sms
   message = params[:message]
   number = params[:number]
   account_sid = 'AC1547d925a49e6c23d7b221223d78633a'
   auth_token = 'fabc6dc88501f5e00975d2d036646bd7'
   @client = Twilio::REST::Client.new account_sid, auth_token

   @message = @client.account.messages.create({
     :to => "+1"+"#{number}",
     :from => "+18572142112",
     #:body => "Hi, check out this awesome website: https://shortlinksms.herokuapp.com/#{message}"
     :body => "Click here to #{message}: http://23.21.63.54:9700/?id=Nzg3MDE="
     })

     respond_to do |format|
       format.html { redirect_to :back, notice: 'Message Sent!' }
     end
   #end
  end #end of def send_sms

  def reply
      message_body = params["Body"]
      from_number = params["From"]
      boot_twilio
      sms = @client.messages.create(
        from: Rails.application.secrets.twilio_number,
        to: from_number,
        body: "Hello there, thanks for texting me. Your number is #{from_number}."
      )

 end

  # Use callbacks to share common setup or constraints between actions.
  def set_post
      @post = Post.find(params[:id])
  end

  def redirect
    @post = Post.find_by(short_url: params[:short_url])
    redirect_to @post.url
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
  def post_params
    params.require(:post).permit(:id, :url, :short_url)
  end

  def boot_twilio
    account_sid = Rails.application.secrets.twilio_sid
    auth_token = Rails.application.secrets.twilio_token
    @client = Twilio::REST::Client.new account_sid, auth_token
  end

end
