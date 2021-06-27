require 'rails_helper'
RSpec.describe "/artworks", type: :request do
  let(:valid_attributes) {
  # # @valid_attributes = {
  #   name: "Peaceful Prairie",
  #   description: "Inspired by the eastern plains of Colorado",
  #   image: "https://i.imgur.com/KntRJfab.jpg",
  #   create_date: "2021-01-12 02:43:16.644577",
  #   sell_date: nil,
  #   cost: 350.00,
  #   available: true
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the headers
  # in order to pass any filters (e.g. authentication) defined in
  # ArtworksController, or in your router and rack
  # middleware. Be sure to keep this updated too.
  let(:valid_headers) {
    {}
  }

  describe "GET /index" do
    it "renders a successful response" do
      valid_attributes = {
        name: "Peaceful Prairie",
        description: "Inspired by the eastern plains of Colorado",
        image: "https://i.imgur.com/KntRJfab.jpg",
        create_date: "2021-01-12 02:43:16.644577",
        sell_date: nil,
        cost: 350.00,
        available: true
      }
      valid_attributes1 = {
        name: "Crazy Calm",
        description: "The calm that comes over you in by a high mountain lake",
        image: "https://i.imgur.com/QV39L4Pb.jpg",
        create_date: "2021-01-12 02:43:16.644577",
        sell_date: nil,
        cost: 450.00,
        available: true
      }

      Artwork.create! valid_attributes
      Artwork.create! valid_attributes1
      get artworks_url, headers: valid_headers, as: :json

      expect(response).to be_successful
      expect(response.body).to be_a String
      json = JSON.parse(response.body, symbolize_names: true)

      expect(json.count).to eq 2
      expect(json[0][:name]).to be_a String
      expect(json[0][:name]).to eq("Peaceful Prairie")
      expect(json[0][:description]).to be_a String
      expect(json[0][:description]).to eq("Inspired by the eastern plains of Colorado")
      expect(json[0][:description]).to_not eq("The calm that comes over you in by a high mountain lake")
      expect(json[0][:image]).to be_a String
      expect(json[0][:image]).to eq("https://i.imgur.com/KntRJfab.jpg")
      expect(json[0][:create_date]).to be_a String
      expect(json[0][:create_date]).to eq("2021-01-12")
      expect(json[0][:sell_date]).to eq(nil)
      expect(json[0][:cost]).to be_a Float
      expect(json[0][:cost]).to eq(350.00)
      expect(json[0][:cost]).to_not eq(450.00)
      expect(json[0][:available]).to eq(true)
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      valid_attributes = {
        name: "Peaceful Prairie",
        description: "Inspired by the eastern plains of Colorado",
        image: "https://i.imgur.com/KntRJfab.jpg",
        create_date: "2021-01-12 02:43:16.644577",
        sell_date: nil,
        cost: 350.00,
        available: true
      }
      artwork = Artwork.create! valid_attributes
      get artwork_url(artwork), as: :json
      expect(response).to be_successful
      json = JSON.parse(response.body, symbolize_names: true)

      expect(json[:name]).to be_a String
      expect(json[:description]).to be_a String
      expect(json[:image]).to be_a String
      expect(json[:create_date]).to be_a String
      expect(json[:sell_date]).to eq(nil)
      expect(json[:cost]).to be_a Float
      expect(json[:available]).to eq(true)
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Artwork" do
        peaceful_prairie = {
          name: "Peaceful Prairie",
          description: "Inspired by the eastern plains of Colorado",
          image: "https://i.imgur.com/KntRJfab.jpg",
          create_date: "2021-01-12 02:43:16.644577",
          sell_date: nil,
          cost: 350.00,
          available: true
        }

        artwork = Artwork.create! peaceful_prairie
        valid_attributes = {
          name: "Crazy Calm",
          description: "The calm that comes over you in by a high mountain lake",
          image: "https://i.imgur.com/QV39L4Pb.jpg",
          create_date: "2021-01-12 02:43:16.644577",
          sell_date: nil,
          cost: 550.00,
          available: true
        }

        json = post artworks_url, params: { artwork: valid_attributes }, headers: valid_headers, as: :json

        expect {
          post artworks_url,
               params: { artwork: valid_attributes }, headers: valid_headers, as: :json
        }.to change(Artwork, :count).by(1)
        expect(json).to eq(201)
      end

      it "renders a JSON response with the new artwork" do
        peaceful_prairie = {
          name: "Peaceful Prairie",
          description: "Inspired by the eastern plains of Colorado",
          image: "https://i.imgur.com/KntRJfab.jpg",
          create_date: "2021-01-12 02:43:16.644577",
          sell_date: nil,
          cost: 350.00,
          available: true
        }

        post artworks_url,
             params: { artwork: peaceful_prairie }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json"))
        json = JSON.parse(response.body, symbolize_names: true)

        expect(json[:name]).to be_a String
        expect(json[:description]).to be_a String
        expect(json[:image]).to be_a String
        expect(json[:create_date]).to be_a String
        expect(json[:sell_date]).to eq(nil)
        expect(json[:cost]).to be_a Float
        expect(json[:available]).to eq(true)
      end
    end

    context "with invalid parameters" do
      it "does not create a new Artwork" do
        invalid_attributes = {
          name: "Crazy Calm",
          description: "The calm that comes over you in by a high mountain lake",
          image: "https://i.imgur.com/QV39L4Pb.jpg",
          create_date: "2021-01-12 02:43:16.644577",
          sell_date: nil,
          cost: nil,
          available: nil
        }

        expect {
          post artworks_url,
               params: { artwork: invalid_attributes }, as: :json
        }.to change(Artwork, :count).by(0)
      end

      it "renders a JSON response with errors for the new artwork" do
        invalid_attributes = {
          name: "Crazy Calm",
          description: "The calm that comes over you in by a high mountain lake",
          image: "https://i.imgur.com/QV39L4Pb.jpg",
          create_date: "2021-01-12 02:43:16.644577",
          sell_date: nil,
          cost: nil,
          available: nil
        }

        post artworks_url,
             params: { artwork: invalid_attributes }, headers: valid_headers, as: :json
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

      it "updates the requested artwork" do
        valid_attributes = {
          name: "Crazy Calm",
          description: "The calm that comes over you in by a high mountain lake",
          image: "https://i.imgur.com/QV39L4Pb.jpg",
          create_date: "2021-01-12 02:43:16.644577",
          sell_date: nil,
          cost: 550.00,
          available: true
        }

        artwork = Artwork.create! valid_attributes

        new_attributes = {
          name: "Crazy Calm",
          description: "The calm that comes over you in by a high mountain lake",
          image: "https://i.imgur.com/QV39L4Pb.jpg",
          create_date: "2021-01-12 02:43:16.644577",
          sell_date: "2021-04-15",
          cost: 550.00,
          available: true
        }

        patch artwork_url(artwork),
              params: { artwork: new_attributes }, headers: valid_headers, as: :json
        artwork.reload

        json = JSON.parse(response.body, symbolize_names: true)

        expect(json).to be_a Hash
        expect(json[:sell_date]).to be_a String
        expect(json[:sell_date]).to eq("2021-04-15")
        expect(json[:sell_date]).to_not eq(nil)

      end

      it "renders a JSON response with the artwork" do
        valid_attributes = {
          name: "Crazy Calm",
          description: "The calm that comes over you in by a high mountain lake",
          image: "https://i.imgur.com/QV39L4Pb.jpg",
          create_date: "2021-01-12 02:43:16.644577",
          sell_date: nil,
          cost: 550.00,
          available: true
        }

        artwork = Artwork.create! valid_attributes

        new_attributes = {
          name: "Crazy Calm",
          description: "The calm that comes over you in by a high mountain lake",
          image: "https://i.imgur.com/QV39L4Pb.jpg",
          create_date: "2021-01-12 02:43:16.644577",
          sell_date: "2021-04-15",
          cost: 550.00,
          available: true
        }

        patch artwork_url(artwork),
              params: { artwork: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the artwork" do
        valid_attributes = {
          name: "Crazy Calm",
          description: "The calm that comes over you in by a high mountain lake",
          image: "https://i.imgur.com/QV39L4Pb.jpg",
          create_date: "2021-01-12 02:43:16.644577",
          sell_date: nil,
          cost: 550.00,
          available: true
        }

        artwork = Artwork.create! valid_attributes

        invalid_attributes = {
          name: "Crazy Calm",
          description: "The calm that comes over you in by a high mountain lake",
          image: nil,
          create_date: "2021-01-12 02:43:16.644577",
          sell_date: "2021-04-15",
          cost: 550.00,
          available: nil
        }

        patch artwork_url(artwork),
              params: { artwork: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq("application/json")
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested artwork" do
      valid_attributes = {
        name: "Crazy Calm",
        description: "The calm that comes over you in by a high mountain lake",
        image: "https://i.imgur.com/QV39L4Pb.jpg",
        create_date: "2021-01-12 02:43:16.644577",
        sell_date: nil,
        cost: 550.00,
        available: true
      }

      artwork = Artwork.create! valid_attributes
      expect {
        delete artwork_url(artwork), headers: valid_headers, as: :json
      }.to change(Artwork, :count).by(-1)
    end
  end
end
