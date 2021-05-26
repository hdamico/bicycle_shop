module ActiveAdminImport
  module ImportableWithAmount
    include ActiveSupport::Concern

    def duplicate_values_by_amount
      amounts = retrieve_amounts
      csv_lines = delete_amount_values
      amounts.each_with_index.each_with_object([]) do |(amount, idx), duplications|
        amount.to_i.times { duplications << csv_lines[idx] }
      end
    end

    private

    def delete_amount_values
      @csv_lines.clone.map(&:clone).each { |line| line.delete_at(amount_index) }
    end

    def retrieve_amounts
      @csv_lines.map { |line| line.slice(amount_index) }
    end

    def amount_index
      @amount_index ||= @headers.find_index { |key, _| key == 'amount' }
    end
  end
end
