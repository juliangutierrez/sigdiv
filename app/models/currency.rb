require 'bndes'

class Currency < ApplicationRecord
	validates :name, presence: true
	validates :formula, presence: true

	def to_brl
		Dentaku(eval_formula.gsub(',', '.'))
	end

	private
		def eval_formula			
			formula.gsub!(/\[(\w*\d*)\]/) do
				if $1.include?('BNDES')
					BNDES.last(parse_code $1)
				elsif $1.include?('BACEN')
					BancoCentral.last(parse_code $1)[:value]
				end
			end
			formula
		end

		def parse_code str
			str.sub(/\D*/, '').to_i
		end
end
