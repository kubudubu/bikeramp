shared_examples :has_valid_factory do |model|
  let(:object) { build(model) }

  it "has valid factory" do
    expect(object).to be_valid
  end

  it "creates valid object" do
    expect(object.save).to eq true
  end
end

shared_examples :is_not_numericality do |model, param|
  let(:object) { create(model, { "#{param}": "not a number!" }) }

  it "raises error" do
    expect { object }.to raise_error(ActiveRecord::RecordInvalid)
  end
end

shared_examples :is_not_nil do |model, param|
  let(:object) { create(model, { "#{param}": nil}) }

  it "raises error" do
    expect { object }.to raise_error(ActiveRecord::RecordInvalid)
  end
end

shared_examples :is_not_date do |model, param|
  let(:object) { create(model, { "#{param}": "is not date literally"}) }

  it "raises error" do
    expect { object }.to raise_error(ActiveRecord::RecordInvalid)
  end
end

shared_examples :is_not_address do |model, param|
  let(:object) { create(model, { "#{param}": "street, city, country, add-on"}) }

  it "raises error" do
    expect { object }.to raise_error(ActiveRecord::RecordInvalid)
  end
end
