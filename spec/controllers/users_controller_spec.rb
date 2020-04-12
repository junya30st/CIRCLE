require 'rails_helper'

# describe 'Controller' do
#   describe 'Get #new' do
#     it "render the :new template" do
#     end
#   end
# end

describe UsersController, type: :controller do

  describe 'Get #show' do

    it "render the :show template" do
      user = create(:user)
      get :show, params: { id: user }
      expect(response).to render_template :show
    end

    # it "assigns the requested tweet to @post" do
    #   user = create_list(:user, 2)
    #   post = create(:post)
    #   get :show
    #   expect(assigns(:post)).to match(post)
    # end

    it "assigns the requested tweet to @user" do
      user = create(:user)
      get :show, params: { id: user }
      expect(assigns(:user)).to eq user
    end
    
  end

end
