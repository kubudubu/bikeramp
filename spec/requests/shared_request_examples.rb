shared_examples :has_status_code do |status_code|
  it "has status code: #{status_code}" do
    request
    expect(controller.response.status).to eq status_code
  end
end

shared_examples :change_objects_size_by do |number, model|
  it "change #{model} objects size by: #{number}" do
    expect { request }.to change(model, :count).by(number)
  end
end

shared_examples :has_error_messages do
  it "has error messages" do
    request
    parsed_body = JSON.parse(controller.response.body)
    expect(parsed_body['errors']).not_to eq nil
  end
end

shared_examples :has_response_as_fields do
  let(:response) { JSON.parse(controller.response.body) }

  before(:each) do
    request
  end

  it "has response as fields" do
    expect(response.keys).to eq expected_fields
  end

  it "has valid number of fields values" do
    expect(response.values.compact.size).to eq expected_fields.size
  end
end

shared_examples :has_response_as_collection_of_fields do
  let(:response) { JSON.parse(controller.response.body) }

  before(:each) do
    request
  end

  it "has response as a collection" do
    expect(response.is_a?(Enumerable)).to eq true
  end

  it "has response as a collection of fields" do
    expect(response.first.keys).to eq expected_fields
  end

  it "has valid number of fields values in first object" do
    expect(response.first.values.compact.size).to eq expected_fields.size
  end
end

shared_examples :has_empty_response_body do
  let(:response) { controller.response.body }

  it "has empty response body" do
    request
    expect(response).to eq ""
  end
end
