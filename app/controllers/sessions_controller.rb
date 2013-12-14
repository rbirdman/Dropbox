require 'rubygems'
require 'net/ldap'

class SessionsController < ApplicationController

  def initialize
    # Off-campus connections MUST be secure. On campus connection can be insecure
    @ldap = Net::LDAP.new(:port => 636, :encryption => :simple_tls)
    #ldap = Net::LDAP.new(:port => 389)
  end
 
  def new
  end

  def create
  	initialize
  	routey_id=params[:session][:netid]
  	routey_password = params[:session][:password]
    ldap.host = "ldap.byu.edu"
    ldap.auth "uid=#{routey_id},ou=People,o=BYU.edu", routey_password
    if !routey_password.empty? and ldap.bind # true | false | throw timeout
    	user = User.find_by(netid: routey_id)
    	if !user
    		user = User.create(netid: routey_id, privilege: "student")
    	end
    	sign_in user
    	redirect_to :root
    else
    	flash[:error] = 'Invalid email/password combination' #Broken!!
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to :root
  end
 
  def ry_signin(*args)
  	initialize
    login(*args)
  end
 
  def cs_signin(cs_id,cs_password)
  	initialize
    # Only works on-campus and only with insecure connections
    ldap = Net::LDAP.new(:port => 389)
    ldap.host = "ldap.cs.byu.edu"
    ldap.auth "uid=#{cs_id},ou=people,dc=cs,dc=byu,dc=edu", cs_password
    ldap.bind
  end
 
  def caedm_signin(caedm_id, caedm_password)
  	initialize
    # I can't find the info for this one
    #ldap = Net::LDAP.new(:port => 389)
    #ldap.host = "????.et.byu.edu"
    #ldap.auth "uid=#{caedm_id},ou=accounts,ou=caedm,dc=et,dc=byu,dc=edu", caedm_password
    #ldap.bind
    false
  end
 
  private
    attr_accessor :ldap
end