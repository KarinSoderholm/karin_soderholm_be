require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/classrooms", type: :request do
  # This should return the minimal set of attributes required to create a valid
  # Classroom. As you add validations to Classroom, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the headers
  # in order to pass any filters (e.g. authentication) defined in
  # ClassroomsController, or in your router and rack
  # middleware. Be sure to keep this updated too.
  let(:valid_headers) {
    {}
  }

  describe "GET /index" do
    it "renders a successful response without requirements or tools" do
      valid_attributes =  {
        name: "Crochet 101",
        description: "The basics of crochet",
        image: "https://i.imgur.com/Q1VOgmfb.jpg",
        date: "2021-04-18",
        time: "02:43:16.644577",
        location: "123 Main St., Wheat Ridge, CO 80033",
        active: true,
        cost: 65.00
      }

      Classroom.create! valid_attributes
      get classrooms_url, headers: valid_headers, as: :json
      expect(response).to be_successful
      json = JSON.parse(response.body, symbolize_names: true)

      expect(json).to be_an Array
      first = json[0]
      expect(first).to be_a Hash
      expect(first[:id]).to be_an Integer
      expect(first[:name]).to be_a String
      expect(first[:description]).to be_a String
      expect(first[:image]).to be_a String
      expect(first[:date]).to be_a String
      expect(first[:time]).to be_a String
      expect(first[:cost]).to be_a Float
      expect(first[:active]).to eq(true)
    end

    it "renders a successful response with requirements or tools" do
      valid_attributes =  {
        name: "Crochet 201",
        description: "The intermediate course about crochet",
        image: "https://i.imgur.com/Q1VOgmfb.jpg",
        date: "2021-04-18",
        time: "22:00",
        location: "123 Main St., Wheat Ridge, CO 80033",
        active: true,
        cost: 65.00
      }

      classroom = Classroom.create! valid_attributes

      get classrooms_url, headers: valid_headers, as: :json
      expect(response).to be_successful
      json = JSON.parse(response.body, symbolize_names: true)

      expect(json).to be_an Array
      first = json[0]
      expect(first).to be_a Hash
      expect(first[:id]).to be_an Integer
      expect(first[:name]).to be_a String
      expect(first[:description]).to be_a String
      expect(first[:image]).to be_a String
      expect(first[:date]).to be_a String
      expect(first[:time]).to be_a String
      expect(first[:cost]).to be_a Float
      expect(first[:active]).to eq(true)
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      valid_attributes =  {
        name: "Crochet 201",
        description: "The intermediate course about crochet",
        image: "https://i.imgur.com/Q1VOgmfb.jpg",
        date: "2021-04-18",
        time: "22:00",
        location: "123 Main St., Wheat Ridge, CO 80033",
        active: true,
        cost: 65.00
      }

      classroom = Classroom.create! valid_attributes
      get classroom_url(classroom), as: :json
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Classroom" do
        valid_attributes =  {
          name: "Crochet 201",
          description: "The intermediate course about crochet",
          image: "https://i.imgur.com/Q1VOgmfb.jpg",
          date: "2021-04-18",
          time: "22:00",
          location: "123 Main St., Wheat Ridge, CO 80033",
          active: true,
          cost: 65.00
        }

        expect {
          post classrooms_url,
               params: { classroom: valid_attributes }, headers: valid_headers, as: :json
        }.to change(Classroom, :count).by(1)
      end

      it "renders a JSON response with the new classroom" do
        valid_attributes =  {
          name: "Crochet 201",
          description: "The intermediate course about crochet",
          image: "https://i.imgur.com/Q1VOgmfb.jpg",
          date: "2021-04-18",
          time: "22:00",
          location: "123 Main St., Wheat Ridge, CO 80033",
          active: true,
          cost: 65.00
        }

        post classrooms_url,
             params: { classroom: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Classroom" do
        invalid_attributes =  {
          name: "Crochet 201",
          description: "",
          image: "https://i.imgur.com/Q1VOgmfb.jpg",
          date: "2021-04-18",
          time: "22:00",
          location: "123 Main St., Wheat Ridge, CO 80033",
          active: true,
          cost: 65.00
        }

        expect {
          post classrooms_url,
               params: { classroom: invalid_attributes }, as: :json
        }.to change(Classroom, :count).by(0)
      end

      it "renders a JSON response with errors for the new classroom" do
        invalid_attributes =  {
          name: "Crochet 201",
          description: "The intermediate course about crochet",
          image: "https://i.imgur.com/Q1VOgmfb.jpg",
          date: "2021-04-18",
          time: "22:00",
          location: "123 Main St., Wheat Ridge, CO 80033",
          active: nil,
          cost: 65.00
        }

        post classrooms_url,
             params: { classroom: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq("application/json")
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      # let(:new_attributes) {
      #   skip("Add a hash of attributes valid for your model")
      # }

      it "updates the requested classroom" do
        valid_attributes =  {
          name: "Crochet 201",
          description: "The intermediate course about crochet",
          image: "https://i.imgur.com/Q1VOgmfb.jpg",
          date: "2021-04-18",
          time: "22:00",
          location: "123 Main St., Wheat Ridge, CO 80033",
          active: true,
          cost: 65.00
        }

        classroom = Classroom.create! valid_attributes

        new_attributes =  {
          name: "Crochet 201",
          description: "The intermediate course about crochet",
          image: "https://i.imgur.com/Q1VOgmfb.jpg",
          date: "2021-04-20",
          time: "11:00",
          location: "123 Main St., Wheat Ridge, CO 80033",
          active: true,
          cost: 65.00
        }

        patch classroom_url(classroom),
              params: { classroom: new_attributes }, headers: valid_headers, as: :json
        classroom.reload
        json = JSON.parse(response.body, symbolize_names: true)
        expect(json).to be_a Hash
        expect(json[:id]).to be_an Integer
        expect(json[:name]).to be_an String
        expect(json[:description]).to be_an String
        expect(json[:image]).to be_an String
        expect(json[:date]).to be_an String
        expect(json[:date]).to eq("2021-04-20")
        expect(json[:date]).to_not eq("2021-04-18")
        expect(json[:time]).to be_an String
        expect(json[:time]).to eq("2000-01-01T11:00:00.000Z")
        expect(json[:time]).to_not eq("22:00")
        expect(json[:location]).to be_an String
        expect(json[:cost]).to be_an Float
        expect(json[:active]).to eq(true)
      end

      it "renders a JSON response with the classroom" do
        valid_attributes =  {
          name: "Crochet 201",
          description: "The intermediate course about crochet",
          image: "https://i.imgur.com/Q1VOgmfb.jpg",
          date: "2021-04-18",
          time: "22:00",
          location: "123 Main St., Wheat Ridge, CO 80033",
          active: true,
          cost: 65.00
        }

        classroom = Classroom.create! valid_attributes

        new_attributes =  {
          name: "Crochet 201",
          description: "The intermediate course about crochet",
          image: "https://i.imgur.com/Q1VOgmfb.jpg",
          date: "2021-04-20",
          time: "02:43:16.644577",
          location: "123 Main St., Wheat Ridge, CO 80033",
          active: false,
          cost: 85.00
        }

        patch classroom_url(classroom),
              params: { classroom: new_attributes }, headers: valid_headers, as: :json

        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including("application/json"))
        expect(response.status).to eq(200)
        json = JSON.parse(response.body, symbolize_names: true)
        expect(json).to be_a Hash
        expect(json[:name]).to be_a String
        expect(json[:description]).to be_a String
        expect(json[:image]).to be_a String
        expect(json[:date]).to be_a String
        expect(json[:time]).to be_a String
        expect(json[:location]).to be_a String
        expect(json[:cost]).to be_a Float
        expect(json[:active]).to eq(false)
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the classroom" do
        valid_attributes =  {
          name: "Crochet 201",
          description: "The intermediate course about crochet",
          image: "https://i.imgur.com/Q1VOgmfb.jpg",
          date: "2021-04-18",
          time: "22:00",
          location: "123 Main St., Wheat Ridge, CO 80033",
          active: true,
          cost: 65.00
        }

        classroom = Classroom.create! valid_attributes

        invalid_attributes =  {
          name: "Crochet 201",
          description: "The intermediate course about crochet",
          image: "",
          date: "2021-04-20",
          time: "11:00",
          location: "123 Main St., Wheat Ridge, CO 80033",
          active: false,
          cost: nil
        }

        patch classroom_url(classroom),
              params: { classroom: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq("application/json")
        json = JSON.parse(response.body, symbolize_names: true)
        expect(json).to be_a Hash
        expect(json[:image]).to eq(["can't be blank"])
        expect(json[:cost]).to eq(["can't be blank"])
        expect(response.status).to eq(422)
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested classroom" do
      valid_attributes =  {
        name: "Crochet 201",
        description: "The intermediate course about crochet",
        image: "https://i.imgur.com/Q1VOgmfb.jpg",
        date: "2021-04-18",
        time: "22:00",
        location: "123 Main St., Wheat Ridge, CO 80033",
        active: true,
        cost: 65.00
      }

      classroom = Classroom.create! valid_attributes
      expect {
        delete classroom_url(classroom), headers: valid_headers, as: :json
      }.to change(Classroom, :count).by(-1)
    end
  end
end
