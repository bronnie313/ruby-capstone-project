require_relative '../book'
require_relative '../label'
require_relative '../add_book'

describe Book do
  before :each do
    @book = Book.new('2022/09/09', 'publisher', 'cover_state')
  end

  it 'check for book instance' do
    expect(@book).to be_instance_of Book
  end

  it 'check for attributes' do
    expect(@book.publish_date).to eq('2022/09/09')
  end

  it 'check for the publisher' do
    expect(@book.publisher).to eq('publisher')
  end

  it 'check for the cover_state' do
    expect(@book.cover_state).to eq('cover_state')
  end

  it 'check if book can be archived' do
    book = Book.new('2022/09/09', 'publisher', 'good')
    expect(book.can_be_archived?).to be_falsey
  end
end

describe Label do
  it 'check for label instance' do
    label = Label.new('Mystery', 'blue')
    expect(label).to be_instance_of Label
  end

  it 'check for attributes' do
    label = Label.new('Mystery', 'blue')
    expect(label.title).to eq('Mystery')
    expect(label.color).to eq('blue')
  end

  it 'check if item can be added to label' do
    label = Label.new('Mystery', 'blue')
    item = Item.new
    label.add_item(item)
    expect(label.items).to include(item)
    expect(item.label).to eq(label)
  end
end

describe AddBook do
  it 'check if books can be listed' do
    add_book = AddBook.new
    book = Book.new('2022/09/09', 'publisher', 'good')
    add_book.instance_variable_get(:@books) << book

    expect { add_book.list_books }.to output(
      %r{Publisher: publisher, Publish date: 2022/09/09, Cover State: good}
    ).to_stdout
  end

  it 'check if labels can be listed' do
    add_book = AddBook.new
    label = Label.new('Mystery', 'blue')
    add_book.instance_variable_get(:@labels) << label

    expect { add_book.list_labels }.to output(/Title: Mystery, color: blue/).to_stdout
  end
end
