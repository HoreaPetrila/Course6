# frozen_string_literal: true

class Team < ApplicationRecord
  require 'csv'
  has_one :manager
  has_many :players
  accepts_nested_attributes_for :manager
  validates_presence_of :name

  def self.to_csv
    attributes = [:name, :abbreviation]
    headers = %w(name abbreviation managername players)
    CSV.generate(headers: true) do |csv|
      csv << headers
      all.each do |team|
        a = attributes.map { |attr| team.send(attr) }
        a << team.manager.name
        team.players.each do |player|
          a << player.name
        end
        csv << a
      end
    end
  end
  end
