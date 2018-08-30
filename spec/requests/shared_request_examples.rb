shared_examples :has_status_code do |status_code|
  it "has status code: #{status_code}" do
    subject
    expect(controller.response.status).to eq status_code
  end
end

shared_examples :change_objects_size_by do |number, model|
  it "change #{model} objects size by: #{number}" do
    expect { subject }.to change(model, :count).by(number)
  end
end

shared_examples :has_error_messages do
  it "has error messages" do
    subject
    parsed_body = JSON.parse(controller.response.body)
    expect(parsed_body['errors']).not_to eq nil
  end
end

shared_examples :has_response_as_fields do
  let(:response) { JSON.parse(controller.response.body) }

  before(:each) do
    subject
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
    subject
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
    subject
    expect(response).to eq ""
  end
end

shared_examples :has_proper_field_value do |field, result|
  let(:response) { JSON.parse(controller.response.body) }

  it "has proper #{field} value" do
    subject
    expect(response[field.to_s]).to eq result
  end
end

shared_examples :has_proper_field_value_in_collection do |field, result|
  let(:response) { JSON.parse(controller.response.body) }

  it "has proper #{field} value in collection" do
    subject
    expect(response.first[field.to_s]).to eq result
  end
end
