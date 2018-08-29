shared_examples :returns_status_code do |status_code|
  it "returns status code: #{status_code}" do
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
