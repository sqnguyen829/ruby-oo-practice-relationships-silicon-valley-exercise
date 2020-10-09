class VentureCapitalist
    attr_accessor :name, :total_worth

    @@all = []

    def initialize(name, total_worth)
        @name = name
        @total_worth = total_worth

        @@all << self
    end

    def self.all
        @@all
    end

    def self.tres_commas_club
        club = []
        @@all.each do |vc|
            if vc.total_worth > 1000000000
                club << vc
            end
        end
        club

        # @@all.select {|vc| vc.total_worth > 1000000000}
    end

    def offer_contract(startup, type, amount)
        FundingRound.new(startup, self, type, amount)
    end

    def funding_rounds
        FundingRound.all.select {|fr| fr.venture_capitalist == self}
    end

    def portfolio
        funding_rounds.map {|fr| fr.startup}.uniq
    end

    def biggest_investment
        self.funding_rounds.max_by do |fr|
            fr.investment
        end
    end

    def invested(name_domain)
        total = 0
        self.funding_rounds.each do |fr|
            if fr.startup.domain == name_domain
                total = total + fr.investment
            end
        end
        total
    end

end
