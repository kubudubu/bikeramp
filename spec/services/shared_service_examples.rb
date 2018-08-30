shared_examples :raises_error do |error|
  it "raises error: #{error}" do
    expect { subject }.to raise_error(error)
  end
end

shared_examples :creates_object do |model|
  it "creates new object of type: #{model}" do
    expect { subject }.to change(model, :count).by(1)
  end

  it "adds id to object of type: #{model}" do
    expect(subject.id).not_to eq nil
  end
end
