require 'rails_helper'

RSpec.describe "/artist_statements", type: :request do
  # This should return the minimal set of attributes required to create a valid
  # ArtistStatement. As you add validations to ArtistStatement, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the headers
  # in order to pass any filters (e.g. authentication) defined in
  # ArtistStatementsController, or in your router and rack
  # middleware. Be sure to keep this updated too.
  let(:valid_headers) {
    {}
  }

  describe "GET /index" do
    it "renders a successful response" do
      artwork_attributes = {
        name: "Crazy Calm",
        description: "The calm that comes over you in by a high mountain lake",
        image: "https://i.imgur.com/QV39L4Pb.jpg",
        create_date: "2021-01-12 02:43:16.644577",
        sell_date: nil,
        cost: 450.00,
        available: true
      }

      artwork = Artwork.create! artwork_attributes

      valid_attributes = {
        name: "Sailing over the Mountains",
        statement: "My studio practice is rooted in an exploration of my Caribbean-American background. It draws strongly on the complexity of heritage and assumed norms that are referenced from memories, history, literature and our current xenophobic zeitgeist. I consider myself a visual anthropologist, cataloguing and surveying these experiences.
          Whether I was aware of it or not, 'otherness' has been at the center of my consciousness. My early ideals of beauty were shaped by and linked through paintings throughout art history and photographs in fashion magazines. Those images were mythical, heroic, beautiful, powerful, and embodied a particular “Venus” that didn’t look like me, which influenced the way I viewed myself. It is this cultural history of female exposé, presentation, mutation, and myth that led me to investigate the way our identities have been imagined, invented and shaped through societal interpretations.
          Works featured in Passing Between the Lines are a new body of work from two ongoing studio series entitled Strangefruit and Invisible Visibility. Through abstraction and pattern, Passing Between the Lines examines the concepts and experience of intersectionality, cultural ambiguity, “invisible blackness” and “Double-Consciousness”. Black and white stripe patterns are used throughout each work to evoke multiple layers and meanings.
          Stripes are often associated with animals, incarceration, fences, trickery, borders, flags, barcodes and hybridity. The pattern is used as a barrier to signify the displacement of marginalized bodies and the relentless ongoing social and political systems of abuse in this country. Employing coils of hair tied-up in gold links, Afros and some featuring lips, these muses are obscured from their identity creating a psychology of the familiar and ambiguous.
          The word “passing” in the exhibition title is a direct reference to the literary legacy and anthology of Harlem Renaissance writer Nella Larsen. Larson’s fictional stories entitled Passing and Quicksand are about women as “emotional nomads” navigating on impulse to shape-shift among society in order to survive or ‘pass’ between the lines of race is easily identifiable to me.
          As a result, the works are anonymous portraits that represent intersectional-identity, alienation and otherness.",
        artwork_id: artwork.id
      }

      ArtistStatement.create! valid_attributes
      get artist_statements_url, headers: valid_headers, as: :json
      expect(response).to be_successful
      expect(response.status).to eq(200)
      json = JSON.parse(response.body, symbolize_names: true)
      expect(json).to be_an Array
      first = json[0]
      expect(first[:id]).to be_a Integer
      expect(first[:name]).to be_a String
      expect(first[:name]).to eq("Sailing over the Mountains")
      expect(first[:statement]).to be_a String
      expect(first[:statement]).to eq(valid_attributes[:statement])
      expect(first[:artwork_id]).to be_a Integer
      expect(first[:artwork_id]).to eq(artwork.id)
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      artwork_attributes = {
        name: "Crazy Calm",
        description: "The calm that comes over you in by a high mountain lake",
        image: "https://i.imgur.com/QV39L4Pb.jpg",
        create_date: "2021-01-12 02:43:16.644577",
        sell_date: nil,
        cost: 450.00,
        available: true
      }

      artwork = Artwork.create! artwork_attributes
      valid_attributes = {
        name: "Sailing over the Mountains",
        statement: "My studio practice is rooted in an exploration of my Caribbean-American background. It draws strongly on the complexity of heritage and assumed norms that are referenced from memories, history, literature and our current xenophobic zeitgeist. I consider myself a visual anthropologist, cataloguing and surveying these experiences.
          Whether I was aware of it or not, 'otherness' has been at the center of my consciousness. My early ideals of beauty were shaped by and linked through paintings throughout art history and photographs in fashion magazines. Those images were mythical, heroic, beautiful, powerful, and embodied a particular “Venus” that didn’t look like me, which influenced the way I viewed myself. It is this cultural history of female exposé, presentation, mutation, and myth that led me to investigate the way our identities have been imagined, invented and shaped through societal interpretations.
          Works featured in Passing Between the Lines are a new body of work from two ongoing studio series entitled Strangefruit and Invisible Visibility. Through abstraction and pattern, Passing Between the Lines examines the concepts and experience of intersectionality, cultural ambiguity, “invisible blackness” and “Double-Consciousness”. Black and white stripe patterns are used throughout each work to evoke multiple layers and meanings.
          Stripes are often associated with animals, incarceration, fences, trickery, borders, flags, barcodes and hybridity. The pattern is used as a barrier to signify the displacement of marginalized bodies and the relentless ongoing social and political systems of abuse in this country. Employing coils of hair tied-up in gold links, Afros and some featuring lips, these muses are obscured from their identity creating a psychology of the familiar and ambiguous.
          The word “passing” in the exhibition title is a direct reference to the literary legacy and anthology of Harlem Renaissance writer Nella Larsen. Larson’s fictional stories entitled Passing and Quicksand are about women as “emotional nomads” navigating on impulse to shape-shift among society in order to survive or ‘pass’ between the lines of race is easily identifiable to me.
          As a result, the works are anonymous portraits that represent intersectional-identity, alienation and otherness.",
        artwork_id: artwork.id
      }

      artist_statement = ArtistStatement.create! valid_attributes
      get artist_statement_url(artist_statement), as: :json
      expect(response).to be_successful
      json = JSON.parse(response.body, symbolize_names: true)
      expect(json).to be_an Hash

      expect(json[:id]).to be_a Integer
      expect(json[:name]).to be_a String
      expect(json[:name]).to eq("Sailing over the Mountains")
      expect(json[:name]).to_not eq("Crazy Calm")
      expect(json[:statement]).to be_a String
      expect(json[:statement]).to eq(valid_attributes[:statement])
      expect(json[:statement]).to_not eq(nil)
      expect(json[:artwork_id]).to be_a Integer
      expect(json[:artwork_id]).to eq(artwork.id)
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new ArtistStatement" do
        artwork_attributes = {
          name: "Crazy Calm",
          description: "The calm that comes over you in by a high mountain lake",
          image: "https://i.imgur.com/QV39L4Pb.jpg",
          create_date: "2021-01-12 02:43:16.644577",
          sell_date: nil,
          cost: 450.00,
          available: true
        }

        artwork = Artwork.create! artwork_attributes
        valid_attributes = {
          name: "Sailing over the Mountains",
          statement: "My studio practice is rooted in an exploration of my Caribbean-American background. It draws strongly on the complexity of heritage and assumed norms that are referenced from memories, history, literature and our current xenophobic zeitgeist. I consider myself a visual anthropologist, cataloguing and surveying these experiences.
            Whether I was aware of it or not, 'otherness' has been at the center of my consciousness. My early ideals of beauty were shaped by and linked through paintings throughout art history and photographs in fashion magazines. Those images were mythical, heroic, beautiful, powerful, and embodied a particular “Venus” that didn’t look like me, which influenced the way I viewed myself. It is this cultural history of female exposé, presentation, mutation, and myth that led me to investigate the way our identities have been imagined, invented and shaped through societal interpretations.
            Works featured in Passing Between the Lines are a new body of work from two ongoing studio series entitled Strangefruit and Invisible Visibility. Through abstraction and pattern, Passing Between the Lines examines the concepts and experience of intersectionality, cultural ambiguity, “invisible blackness” and “Double-Consciousness”. Black and white stripe patterns are used throughout each work to evoke multiple layers and meanings.
            Stripes are often associated with animals, incarceration, fences, trickery, borders, flags, barcodes and hybridity. The pattern is used as a barrier to signify the displacement of marginalized bodies and the relentless ongoing social and political systems of abuse in this country. Employing coils of hair tied-up in gold links, Afros and some featuring lips, these muses are obscured from their identity creating a psychology of the familiar and ambiguous.
            The word “passing” in the exhibition title is a direct reference to the literary legacy and anthology of Harlem Renaissance writer Nella Larsen. Larson’s fictional stories entitled Passing and Quicksand are about women as “emotional nomads” navigating on impulse to shape-shift among society in order to survive or ‘pass’ between the lines of race is easily identifiable to me.
            As a result, the works are anonymous portraits that represent intersectional-identity, alienation and otherness.",
          artwork_id: artwork.id
        }

        expect {
          post artist_statements_url,
               params: { artist_statement: valid_attributes }, headers: valid_headers, as: :json
        }.to change(ArtistStatement, :count).by(1)
        expect(response.status).to eq(201)
      end

      it "renders a JSON response with the new artist_statement" do
        artwork_attributes = {
          name: "Crazy Calm",
          description: "The calm that comes over you in by a high mountain lake",
          image: "https://i.imgur.com/QV39L4Pb.jpg",
          create_date: "2021-01-12 02:43:16.644577",
          sell_date: nil,
          cost: 450.00,
          available: true
        }

        artwork = Artwork.create! artwork_attributes
        valid_attributes = {
          name: "Sailing over the Mountains",
          statement: "My studio practice is rooted in an exploration of my Caribbean-American background. It draws strongly on the complexity of heritage and assumed norms that are referenced from memories, history, literature and our current xenophobic zeitgeist. I consider myself a visual anthropologist, cataloguing and surveying these experiences.
            Whether I was aware of it or not, 'otherness' has been at the center of my consciousness. My early ideals of beauty were shaped by and linked through paintings throughout art history and photographs in fashion magazines. Those images were mythical, heroic, beautiful, powerful, and embodied a particular “Venus” that didn’t look like me, which influenced the way I viewed myself. It is this cultural history of female exposé, presentation, mutation, and myth that led me to investigate the way our identities have been imagined, invented and shaped through societal interpretations.
            Works featured in Passing Between the Lines are a new body of work from two ongoing studio series entitled Strangefruit and Invisible Visibility. Through abstraction and pattern, Passing Between the Lines examines the concepts and experience of intersectionality, cultural ambiguity, “invisible blackness” and “Double-Consciousness”. Black and white stripe patterns are used throughout each work to evoke multiple layers and meanings.
            Stripes are often associated with animals, incarceration, fences, trickery, borders, flags, barcodes and hybridity. The pattern is used as a barrier to signify the displacement of marginalized bodies and the relentless ongoing social and political systems of abuse in this country. Employing coils of hair tied-up in gold links, Afros and some featuring lips, these muses are obscured from their identity creating a psychology of the familiar and ambiguous.
            The word “passing” in the exhibition title is a direct reference to the literary legacy and anthology of Harlem Renaissance writer Nella Larsen. Larson’s fictional stories entitled Passing and Quicksand are about women as “emotional nomads” navigating on impulse to shape-shift among society in order to survive or ‘pass’ between the lines of race is easily identifiable to me.
            As a result, the works are anonymous portraits that represent intersectional-identity, alienation and otherness.",
          artwork_id: artwork.id
        }

        post artist_statements_url,
             params: { artist_statement: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json"))
        json = JSON.parse(response.body, symbolize_names: true)
        expect(json).to be_an Hash

        expect(json[:id]).to be_a Integer
        expect(json[:name]).to be_a String
        expect(json[:name]).to eq("Sailing over the Mountains")
        expect(json[:name]).to_not eq("Crazy Calm")
        expect(json[:statement]).to be_a String
        expect(json[:statement]).to eq(valid_attributes[:statement])
        expect(json[:statement]).to_not eq(nil)
        expect(json[:artwork_id]).to be_a Integer
        expect(json[:artwork_id]).to eq(artwork.id)
      end
    end

    context "with invalid parameters" do
      it "does not create a new ArtistStatement" do
        artwork_attributes = {
          name: "Crazy Calm",
          description: "The calm that comes over you in by a high mountain lake",
          image: "https://i.imgur.com/QV39L4Pb.jpg",
          create_date: "2021-01-12 02:43:16.644577",
          sell_date: nil,
          cost: 450.00,
          available: true
        }

        artwork = Artwork.create! artwork_attributes
        invalid_attributes = {
          name: "Sailing over the Mountains",
          statement: "",
          artwork_id: artwork.id
        }

        expect {
          post artist_statements_url,
               params: { artist_statement: invalid_attributes }, as: :json
        }.to change(ArtistStatement, :count).by(0)
        expect(response.status).to eq(422)
      end

      it "renders a JSON response with errors for the new artist_statement" do
        invalid_attributes = {
          name: "Sailing over the Mountains",
          statement: "My studio practice is rooted in an exploration of my Caribbean-American background. It draws strongly on the complexity of heritage and assumed norms that are referenced from memories, history, literature and our current xenophobic zeitgeist. I consider myself a visual anthropologist, cataloguing and surveying these experiences.
            Whether I was aware of it or not, 'otherness' has been at the center of my consciousness. My early ideals of beauty were shaped by and linked through paintings throughout art history and photographs in fashion magazines. Those images were mythical, heroic, beautiful, powerful, and embodied a particular “Venus” that didn’t look like me, which influenced the way I viewed myself. It is this cultural history of female exposé, presentation, mutation, and myth that led me to investigate the way our identities have been imagined, invented and shaped through societal interpretations.
            Works featured in Passing Between the Lines are a new body of work from two ongoing studio series entitled Strangefruit and Invisible Visibility. Through abstraction and pattern, Passing Between the Lines examines the concepts and experience of intersectionality, cultural ambiguity, “invisible blackness” and “Double-Consciousness”. Black and white stripe patterns are used throughout each work to evoke multiple layers and meanings.
            Stripes are often associated with animals, incarceration, fences, trickery, borders, flags, barcodes and hybridity. The pattern is used as a barrier to signify the displacement of marginalized bodies and the relentless ongoing social and political systems of abuse in this country. Employing coils of hair tied-up in gold links, Afros and some featuring lips, these muses are obscured from their identity creating a psychology of the familiar and ambiguous.
            The word “passing” in the exhibition title is a direct reference to the literary legacy and anthology of Harlem Renaissance writer Nella Larsen. Larson’s fictional stories entitled Passing and Quicksand are about women as “emotional nomads” navigating on impulse to shape-shift among society in order to survive or ‘pass’ between the lines of race is easily identifiable to me.
            As a result, the works are anonymous portraits that represent intersectional-identity, alienation and otherness.",
          artwork_id: nil
        }

        post artist_statements_url,
             params: { artist_statement: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq("application/json")
        json = JSON.parse(response.body, symbolize_names: true)
        expect(json).to be_a Hash
        expect(json[:artwork]).to eq(["must exist"])
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested artist_statement" do
        artwork_attributes = {
          name: "Crazy Calm",
          description: "The calm that comes over you in by a high mountain lake",
          image: "https://i.imgur.com/QV39L4Pb.jpg",
          create_date: "2021-01-12 02:43:16.644577",
          sell_date: nil,
          cost: 450.00,
          available: true
        }

        artwork = Artwork.create! artwork_attributes
        valid_attributes = {
          name: "Sailing over the Mountains",
          statement: "My studio practice is rooted in an exploration of my Caribbean-American background. It draws strongly on the complexity of heritage and assumed norms that are referenced from memories, history, literature and our current xenophobic zeitgeist. I consider myself a visual anthropologist, cataloguing and surveying these experiences.
            Whether I was aware of it or not, 'otherness' has been at the center of my consciousness. My early ideals of beauty were shaped by and linked through paintings throughout art history and photographs in fashion magazines. Those images were mythical, heroic, beautiful, powerful, and embodied a particular “Venus” that didn’t look like me, which influenced the way I viewed myself. It is this cultural history of female exposé, presentation, mutation, and myth that led me to investigate the way our identities have been imagined, invented and shaped through societal interpretations.
            Works featured in Passing Between the Lines are a new body of work from two ongoing studio series entitled Strangefruit and Invisible Visibility. Through abstraction and pattern, Passing Between the Lines examines the concepts and experience of intersectionality, cultural ambiguity, “invisible blackness” and “Double-Consciousness”. Black and white stripe patterns are used throughout each work to evoke multiple layers and meanings.
            Stripes are often associated with animals, incarceration, fences, trickery, borders, flags, barcodes and hybridity. The pattern is used as a barrier to signify the displacement of marginalized bodies and the relentless ongoing social and political systems of abuse in this country. Employing coils of hair tied-up in gold links, Afros and some featuring lips, these muses are obscured from their identity creating a psychology of the familiar and ambiguous.
            The word “passing” in the exhibition title is a direct reference to the literary legacy and anthology of Harlem Renaissance writer Nella Larsen. Larson’s fictional stories entitled Passing and Quicksand are about women as “emotional nomads” navigating on impulse to shape-shift among society in order to survive or ‘pass’ between the lines of race is easily identifiable to me.
            As a result, the works are anonymous portraits that represent intersectional-identity, alienation and otherness.",
          artwork_id: artwork.id
        }

        artist_statement = ArtistStatement.create! valid_attributes
        new_attributes = {
          name: "Exploring my Caribbean roots",
          statement: "My studio practice is rooted in an exploration of my Caribbean-American background. It draws strongly on the complexity of heritage and assumed norms that are referenced from memories, history, literature and our current xenophobic zeitgeist. I consider myself a visual anthropologist, cataloguing and surveying these experiences.
            Whether I was aware of it or not, 'otherness' has been at the center of my consciousness. My early ideals of beauty were shaped by and linked through paintings throughout art history and photographs in fashion magazines. Those images were mythical, heroic, beautiful, powerful, and embodied a particular “Venus” that didn’t look like me, which influenced the way I viewed myself. It is this cultural history of female exposé, presentation, mutation, and myth that led me to investigate the way our identities have been imagined, invented and shaped through societal interpretations.
            Works featured in Passing Between the Lines are a new body of work from two ongoing studio series entitled Strangefruit and Invisible Visibility. Through abstraction and pattern, Passing Between the Lines examines the concepts and experience of intersectionality, cultural ambiguity, “invisible blackness” and “Double-Consciousness”. Black and white stripe patterns are used throughout each work to evoke multiple layers and meanings.
            Stripes are often associated with animals, incarceration, fences, trickery, borders, flags, barcodes and hybridity. The pattern is used as a barrier to signify the displacement of marginalized bodies and the relentless ongoing social and political systems of abuse in this country. Employing coils of hair tied-up in gold links, Afros and some featuring lips, these muses are obscured from their identity creating a psychology of the familiar and ambiguous.
            The word “passing” in the exhibition title is a direct reference to the literary legacy and anthology of Harlem Renaissance writer Nella Larsen. Larson’s fictional stories entitled Passing and Quicksand are about women as “emotional nomads” navigating on impulse to shape-shift among society in order to survive or ‘pass’ between the lines of race is easily identifiable to me.
            As a result, the works are anonymous portraits that represent intersectional-identity, alienation and otherness.",
          artwork_id: artwork.id
        }

        patch artist_statement_url(artist_statement),
              params: { artist_statement: new_attributes }, headers: valid_headers, as: :json
        artist_statement.reload
        expect(response.status).to eq(200)
        json = JSON.parse(response.body, symbolize_names: true)
        expect(json).to be_a Hash
        expect(json[:id]).to be_a Integer
        expect(json[:name]).to be_a String
        expect(json[:name]).to eq("Exploring my Caribbean roots")
        expect(json[:name]).to_not eq("Sailing over the Mountains")
        expect(json[:name]).to_not eq("Crazy Calm")
        expect(json[:statement]).to be_a String
        expect(json[:statement]).to eq(valid_attributes[:statement])
        expect(json[:statement]).to_not eq(nil)
        expect(json[:artwork_id]).to be_a Integer
        expect(json[:artwork_id]).to eq(artwork.id)
      end

      it "renders a JSON response with the artist_statement" do
        artwork_attributes = {
          name: "Crazy Calm",
          description: "The calm that comes over you in by a high mountain lake",
          image: "https://i.imgur.com/QV39L4Pb.jpg",
          create_date: "2021-01-12 02:43:16.644577",
          sell_date: nil,
          cost: 450.00,
          available: true
        }

        artwork = Artwork.create! artwork_attributes
        valid_attributes = {
          name: "Sailing over the Mountains",
          statement: "My studio practice is rooted in an exploration of my Caribbean-American background. It draws strongly on the complexity of heritage and assumed norms that are referenced from memories, history, literature and our current xenophobic zeitgeist. I consider myself a visual anthropologist, cataloguing and surveying these experiences.
            Whether I was aware of it or not, 'otherness' has been at the center of my consciousness. My early ideals of beauty were shaped by and linked through paintings throughout art history and photographs in fashion magazines. Those images were mythical, heroic, beautiful, powerful, and embodied a particular “Venus” that didn’t look like me, which influenced the way I viewed myself. It is this cultural history of female exposé, presentation, mutation, and myth that led me to investigate the way our identities have been imagined, invented and shaped through societal interpretations.
            Works featured in Passing Between the Lines are a new body of work from two ongoing studio series entitled Strangefruit and Invisible Visibility. Through abstraction and pattern, Passing Between the Lines examines the concepts and experience of intersectionality, cultural ambiguity, “invisible blackness” and “Double-Consciousness”. Black and white stripe patterns are used throughout each work to evoke multiple layers and meanings.
            Stripes are often associated with animals, incarceration, fences, trickery, borders, flags, barcodes and hybridity. The pattern is used as a barrier to signify the displacement of marginalized bodies and the relentless ongoing social and political systems of abuse in this country. Employing coils of hair tied-up in gold links, Afros and some featuring lips, these muses are obscured from their identity creating a psychology of the familiar and ambiguous.
            The word “passing” in the exhibition title is a direct reference to the literary legacy and anthology of Harlem Renaissance writer Nella Larsen. Larson’s fictional stories entitled Passing and Quicksand are about women as “emotional nomads” navigating on impulse to shape-shift among society in order to survive or ‘pass’ between the lines of race is easily identifiable to me.
            As a result, the works are anonymous portraits that represent intersectional-identity, alienation and otherness.",
          artwork_id: artwork.id
        }

        artist_statement = ArtistStatement.create! valid_attributes
        new_attributes = {
          name: "Sailing over the Mountains",
          statement: "My studio practice is rooted in an exploration of my Caribbean-American background. It draws strongly on the complexity of heritage and assumed norms that are referenced from memories, history, literature and our current xenophobic zeitgeist. I consider myself a visual anthropologist, cataloguing and surveying these experiences.
            Whether I was aware of it or not, 'otherness' has been at the center of my consciousness. My early ideals of beauty were shaped by and linked through paintings throughout art history and photographs in fashion magazines. Those images were mythical, heroic, beautiful, powerful, and embodied a particular “Venus” that didn’t look like me, which influenced the way I viewed myself. It is this cultural history of female exposé, presentation, mutation, and myth that led me to investigate the way our identities have been imagined, invented and shaped through societal interpretations.
            Works featured in Passing Between the Lines are a new body of work from two ongoing studio series entitled Strangefruit and Invisible Visibility. Through abstraction and pattern, Passing Between the Lines examines the concepts and experience of intersectionality, cultural ambiguity, “invisible blackness” and “Double-Consciousness”. Black and white stripe patterns are used throughout each work to evoke multiple layers and meanings.
            Stripes are often associated with animals, incarceration, fences, trickery, borders, flags, barcodes and hybridity. The pattern is used as a barrier to signify the displacement of marginalized bodies and the relentless ongoing social and political systems of abuse in this country. Employing coils of hair tied-up in gold links, Afros and some featuring lips, these muses are obscured from their identity creating a psychology of the familiar and ambiguous.
            The word 'passing' in the exhibition title is a direct reference to the literary legacy and anthology of Harlem Renaissance writer Nella Larsen. Larson’s fictional stories entitled Passing and Quicksand are about women as “emotional nomads” navigating on impulse to shape-shift among society in order to survive or ‘pass’ between the lines of race is easily identifiable to me.
            As a result, the works are anonymous portraits that represent intersectional-identity, alienation and otherness. I hope you enjoy.",
          artwork_id: artwork.id
        }
        patch artist_statement_url(artist_statement),
              params: { artist_statement: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the artist_statement" do
        artwork_attributes = {
          name: "Crazy Calm",
          description: "The calm that comes over you in by a high mountain lake",
          image: "https://i.imgur.com/QV39L4Pb.jpg",
          create_date: "2021-01-12 02:43:16.644577",
          sell_date: nil,
          cost: 450.00,
          available: true
        }

        artwork = Artwork.create! artwork_attributes
        valid_attributes = {
          name: "Sailing over the Mountains",
          statement: "My studio practice is rooted in an exploration of my Caribbean-American background. It draws strongly on the complexity of heritage and assumed norms that are referenced from memories, history, literature and our current xenophobic zeitgeist. I consider myself a visual anthropologist, cataloguing and surveying these experiences.
            Whether I was aware of it or not, 'otherness' has been at the center of my consciousness. My early ideals of beauty were shaped by and linked through paintings throughout art history and photographs in fashion magazines. Those images were mythical, heroic, beautiful, powerful, and embodied a particular “Venus” that didn’t look like me, which influenced the way I viewed myself. It is this cultural history of female exposé, presentation, mutation, and myth that led me to investigate the way our identities have been imagined, invented and shaped through societal interpretations.
            Works featured in Passing Between the Lines are a new body of work from two ongoing studio series entitled Strangefruit and Invisible Visibility. Through abstraction and pattern, Passing Between the Lines examines the concepts and experience of intersectionality, cultural ambiguity, “invisible blackness” and “Double-Consciousness”. Black and white stripe patterns are used throughout each work to evoke multiple layers and meanings.
            Stripes are often associated with animals, incarceration, fences, trickery, borders, flags, barcodes and hybridity. The pattern is used as a barrier to signify the displacement of marginalized bodies and the relentless ongoing social and political systems of abuse in this country. Employing coils of hair tied-up in gold links, Afros and some featuring lips, these muses are obscured from their identity creating a psychology of the familiar and ambiguous.
            The word “passing” in the exhibition title is a direct reference to the literary legacy and anthology of Harlem Renaissance writer Nella Larsen. Larson’s fictional stories entitled Passing and Quicksand are about women as “emotional nomads” navigating on impulse to shape-shift among society in order to survive or ‘pass’ between the lines of race is easily identifiable to me.
            As a result, the works are anonymous portraits that represent intersectional-identity, alienation and otherness.",
          artwork_id: artwork.id
        }
        artist_statement = ArtistStatement.create! valid_attributes
        invalid_attributes = {
          name: "Sailing over the Mountains",
          statement: "",
          artwork_id: artwork.id
        }

        patch artist_statement_url(artist_statement),
              params: { artist_statement: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq("application/json")
        expect(response.status).to eq(422)
        json = JSON.parse(response.body, symbolize_names: true)
        expect(json).to be_a Hash
        expect(json[:statement]).to eq(["can't be blank"])
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested artist_statement" do
      artwork_attributes = {
        name: "Crazy Calm",
        description: "The calm that comes over you in by a high mountain lake",
        image: "https://i.imgur.com/QV39L4Pb.jpg",
        create_date: "2021-01-12 02:43:16.644577",
        sell_date: nil,
        cost: 450.00,
        available: true
      }

      artwork = Artwork.create! artwork_attributes
      valid_attributes = {
        name: "Sailing over the Mountains",
        statement: "My studio practice is rooted in an exploration of my Caribbean-American background. It draws strongly on the complexity of heritage and assumed norms that are referenced from memories, history, literature and our current xenophobic zeitgeist. I consider myself a visual anthropologist, cataloguing and surveying these experiences.
          Whether I was aware of it or not, 'otherness' has been at the center of my consciousness. My early ideals of beauty were shaped by and linked through paintings throughout art history and photographs in fashion magazines. Those images were mythical, heroic, beautiful, powerful, and embodied a particular “Venus” that didn’t look like me, which influenced the way I viewed myself. It is this cultural history of female exposé, presentation, mutation, and myth that led me to investigate the way our identities have been imagined, invented and shaped through societal interpretations.
          Works featured in Passing Between the Lines are a new body of work from two ongoing studio series entitled Strangefruit and Invisible Visibility. Through abstraction and pattern, Passing Between the Lines examines the concepts and experience of intersectionality, cultural ambiguity, “invisible blackness” and “Double-Consciousness”. Black and white stripe patterns are used throughout each work to evoke multiple layers and meanings.
          Stripes are often associated with animals, incarceration, fences, trickery, borders, flags, barcodes and hybridity. The pattern is used as a barrier to signify the displacement of marginalized bodies and the relentless ongoing social and political systems of abuse in this country. Employing coils of hair tied-up in gold links, Afros and some featuring lips, these muses are obscured from their identity creating a psychology of the familiar and ambiguous.
          The word “passing” in the exhibition title is a direct reference to the literary legacy and anthology of Harlem Renaissance writer Nella Larsen. Larson’s fictional stories entitled Passing and Quicksand are about women as “emotional nomads” navigating on impulse to shape-shift among society in order to survive or ‘pass’ between the lines of race is easily identifiable to me.
          As a result, the works are anonymous portraits that represent intersectional-identity, alienation and otherness.",
        artwork_id: artwork.id
      }

      artist_statement = ArtistStatement.create! valid_attributes
      expect {
        delete artist_statement_url(artist_statement), headers: valid_headers, as: :json
      }.to change(ArtistStatement, :count).by(-1)
      expect(response.body).to eq("")
      expect(response.status).to eq(204)
    end
  end
end
