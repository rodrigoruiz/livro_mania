class CpfValidator < ActiveModel::Validator
  def validate(record)
    cpf_array = record.cpf.gsub('.', '').split('-')
    cpf_array[1] ||= ''
    last_digits = cpf_array[1].split('')
    first_digit, second_digit = verification_digits(cpf_array[0])
    
    cpf_is_valid = true
    cpf_is_valid = false unless record.cpf =~ /^[0-9]{3}.[0-9]{3}.[0-9]{3}-[0-9]{2}$/
    cpf_is_valid = false if last_digits[0] != first_digit || last_digits[1] != second_digit
    
    record.errors[:base] << 'CPF is invalid' unless cpf_is_valid
  end
  
  private
    def verification_digits(first_part_of_cpf)
      first_part_of_cpf ||= ''
      
      first_digit = verification_digit(first_part_of_cpf)
      second_digit = verification_digit(first_part_of_cpf + first_digit)
      
      [first_digit, second_digit]
    end
    
    def verification_digit(string)
      total = 0
      string ||= ''
      string.split('').each_with_index do |number, index|
        total += number.to_i * (string.size + 1 - index)
      end
      remainder = total % 11
      
      ((remainder < 2) ? 0 : 11 - remainder).to_s
    end
end
