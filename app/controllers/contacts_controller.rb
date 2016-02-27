class ContactsController < ApplicationController

  def index
    @contacts = Contact.all
  end
  def new
    @contact = Contact.new
      respond_to do |format|
        format.html # new.html.erb
        format.xml  { render :xml => @post }
    end
  end
  def create
    @contact = Contact.create(contact_params)
    respond_to do |format|
      if @contact.save
        format.html  { redirect_to :back, :notice => 'Contact was successfully created.' }
        format.json  { render :json => @contact, :status => :created, :location => @contact }
      else
        format.html  { redirect_to :back, :alert => @contact.errors.full_messages.to_sentence }
        format.json  { render :json => @contact.errors, :status => :unprocessable_entity }
      end
    end
  end
  def show
      @contact = Contact.find(params[:id])
      respond_to do |format|
        format.html # show.html.erb
        format.xml  { render :xml => @post }
      end
  end

  private
  def contact_params
    params.require(:contacts).permit(:first_name, :email, :last_name, :message, :poo_bear)
  end

end
