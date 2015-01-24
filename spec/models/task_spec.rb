require 'rails_helper'

describe 'Due' do
  it 'validates the presence of a description' do
    task = Task.new
    task.valid?
    expect(task.errors[:description].present?).to eq(true)
    task.description = 'test'
    task.valid?
    expect(task.errors[:description].present?).to eq(false)
  end

  it 'validates the presence of a task date that is not in the past' do
    task = Task.new
    task.valid?
    expect(task.errors[:description].present?).to eq(true)
    task.description = 'test'
    task.valid?
    expect(task.errors[:description].present?).to eq(false)
    task.due = Date.today-7
    task.valid?
    expect(task.errors[:due].present?).to eq(true)
    task.due = Date.today+7
    task.valid?
    expect(task.errors[:due].present?).to eq(false)
  end

  it 'validates that task date is valid in edit' do
    task = Task.create!(description: 'task', due: Date.today+7)
    task.due = Date.today-7
    task.valid?
    expect(task.errors[:due].present?).to eq(false)
    task.due = Date.today+7
    task.valid?
    expect(task.errors[:due].present?).to eq(false)
  end
end
