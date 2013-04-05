module ActiveRecord
  class Base
    def self.permalink(attr)
      class_eval <<-END_OF_EVAL
        def to_param
          # 删除：标记符<>、单引号'、非字母数字，并将空格转为'-'
          # 在class_eval中，'\'将被转义，因此'\\'将被class_eval转义为'\'并应用在正则中
          permalink = #{attr}.mb_chars.gsub(/<[^>]*>/, '').gsub(/[']+/, '').gsub(/\\W+/, ' ').strip.downcase.gsub(' ', '-')[0, 128] if #{attr}

          param = id.to_s
          param += '-' + permalink unless permalink.blank?
          
          return param
        end
      END_OF_EVAL
    end
  end
end
