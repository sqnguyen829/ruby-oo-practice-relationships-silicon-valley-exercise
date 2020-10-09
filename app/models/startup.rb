class Startup

    attr_accessor :name, :domain
    attr_reader :founder

    @@all = []

    def initialize(name, founder, domain)
        @name = name
        @founder = founder
        @domain = domain

        @@all << self
    end

    def self.all
        @@all
    end

    def pivot(name, domain)
        @name = name
        @domain = domain
    end
    # Startup.find_by_founder('Tim')
    def self.find_by_founder(founder)
        @@all.find {|startup| startup.founder == founder}
    end

    def self.domains
        @@all.map {|startup| startup.domain}
    end
    
    # s1.sign_contract(vc, type, amount)
    def sign_contract(vc, type, amount)
        FundingRound.new(self, vc, type, amount)
    end

    def num_funding_rounds
        my_fr = []
        FundingRound.all.each do |fr|
            if fr.startup == self
                my_fr << fr
            end
        end
        my_fr.count
    end

    def total_funds
        total = 0
        FundingRound.all.each do |fr|
            if fr.startup == self
                total = total + fr.investment
            end
        end
        total
    end
 
    def investors
        my_vc = []

        FundingRound.all.each do |fr|
            if fr.startup == self
                my_vc << fr.venture_capitalist
            end
        end
        my_vc.uniq
    end

    def big_investors
        big_invest = []
        self.investors.each do |investor|
            if VentureCapitalist.tres_commas_club.include? investor
                big_invest << investor
            end
        end
        big_invest.uniq
    end
end
