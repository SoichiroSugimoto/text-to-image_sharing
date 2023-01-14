require 'csv'
require 'logger'
logger = Logger.new(STDOUT)
logger.level = Logger::WARN


namespace :data_importer do

    def final_judge(success_cnt, all_cnt, file)
        if success_cnt == all_cnt
            p "SUCCESS: " + success_cnt.to_s + " / " + all_cnt.to_s   + " lines are imported from [ " + file + " ]"
        else
            p "Failed" + success_cnt.to_s + " / " + all_cnt.to_s + " lines are imported from [ " + file + " ]"
        end
    end

    desc "insert records from CSV input"
    task :csv_importer,['csv_file'] => :environment do |_t, args|
        file = args[:csv_file]
        csv = CSV.read("#{Rails.root}/db/csv/#{file}")
        attr_array = csv[0]
        all_cnt = 0
        success_cnt = 0
        csv.each_with_index do |row, r_index|
            hash = {}
            next if r_index == 0
            row.each_with_index do |column, c_index|
                hash[attr_array[c_index]] = column
            end
            all_cnt += 1
            begin
                file.gsub(".csv", '').capitalize!.constantize.create!(hash)
                success_cnt += 1
            rescue => invalid
                logger.warn(invalid)
            end
        end
        final_judge(success_cnt, all_cnt, file)
    end
end