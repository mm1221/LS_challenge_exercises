class InvalidCodonError < StandardError
end

class Translation
  def self.of_codon(rna_string)
    result = []
    return codon_seg_trans(rna_string) if rna_string.class == String
    arr.each_char do |seg|
      if codon_seg_trans(seg) == 'STOP' && !result.empty?
        break
      else
        result << codon_seg_trans(seg).to_s
        break if codon_seg_trans(seg).to_s == 'STOP'
      end
    end
    result
  end

  def self.of_rna (codon_string)
    codon_arr = codon_string.scan(/.{3}/)
    result = []
    codon_arr.each do |seg|
      if codon_seg_trans(seg) == 'STOP' && !result.empty?
        break
      else
        result << codon_seg_trans(seg).to_s
        break if codon_seg_trans(seg).to_s == 'STOP'
      end
    end
    result
  end

  def self.codon_seg_trans (seg)
    return 'Methionine' if seg == 'AUG'
    return 'Phenylalanine' if seg == 'UUU' || seg == 'UUC'
    return 'Leucine' if seg == 'UUA' || seg == 'UUG'
    return 'Serine' if seg == 'UCU' || seg == 'UCC' || seg == 'UCA' || seg == 'UCG' 
    return 'Tyrosine' if seg == 'UAU' || seg == 'UAC'
    return 'Cysteine' if seg == 'UGU' || seg == 'UGC'
    return 'Tryptophan' if seg == 'UGG'
    return 'STOP' if seg == 'UAA' || seg == 'UAG' || seg == 'UGA'
    raise InvalidCodonError 
  end
end
