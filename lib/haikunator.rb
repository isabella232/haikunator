require "haikunator/version"
require "securerandom"

module Haikunator
  class << self
    def haikunate(token_range = 9999, delimiter = "-")
      build(token_range, delimiter)
    end

    private

    def build(token_range, delimiter)
      sections = [
        adjectives[random_seed % adjectives.length],
        nouns[random_seed % nouns.length],
        token(token_range)
      ]

      sections.compact.join(delimiter)
    end

    def random_seed
      SecureRandom.random_number(4096)
    end

    def token(range)
      SecureRandom.random_number(range) if range > 0
    end

    def adjectives
      %w(
        agreable
        ancien
        bleu
        calme
        chaud
        clair
        divin
        doux
        exceptionnel
        fier
        frais
        grand
        heureux
        jeune
        joyeux
        juste
        matin
        palpitant
        paradisiaque
        passionnant
        plaisant
        plein
        poli
        possible
        radieux
        riche
        rouge
        saint
        scintillant
        veinard
        vert
        violet
      )
    end

    def nouns
      %w(
        amour
        aurore
        bonbon
        bonheur
        cascade
        ciel
        colline
        eau
        enthousiasme
        euphorie
        exaltation
        extase
        feuille
        fleur
        gloire
        harmonie
        idylle
        joie
        lac
        matin
        montagne
        musique
        nuage
        oiseau
        paillettes
        papillon
        plage
        plaisir
        plume
        prairie
        ravissement
        rivière
        ruisseau
        satisfaction
        soleil
        triomphe
        vague
      ).uniq
    end
  end
end
