class ComplexNumber

    @@counter_add=0
    @@counter_multiply=0
    @@counter_bulck_add=0
    @@counter_bulck_multiply=0

    attr_accessor :real
    attr_accessor :imaginary
  
    def initialize(real=0, imaginary=0)
        @real = real
        @imaginary = imaginary
    end
    
 
  
    def +(other)
      @@counter_add+=1
      new_real=real+other.real
      new_imaginary=imaginary+other.imaginary  
      total=ComplexNumber.new(new_real,new_imaginary)
    end
  

    def multiply(other)
      @@counter_multiply+=1
      new_real = real * other.real - imaginary * other.imaginary
      new_imaginary = imaginary * other.real + real * other.imaginary
      ComplexNumber.new(new_real, new_imaginary)
    end

   

  
 
    def self.bulk_add(others)
      @@counter_bulck_add+=1
      sum_real=0
      sum_imag=0
      others.each do |others|
        sum_real+=others.real
        sum_imag+=others.imaginary
      end
      result=ComplexNumber.new(sum_real,sum_imag)
    end



    def self.bulk_multiply(others)
      @@counter_bulck_multiply+=1
      result = others[0]
      for i in 1...others.length
        @@counter_bulck_multiply-=1
        result = result.multiply(others[i])
      end
      result
    end


    def print 
      puts "#{@real} + #{@imaginary}i"
    end


    def self.get_stats
      puts "Total number of additions: #{@@counter_add} "
      puts "Total number of multiplication: #{@@counter_multiply} " 
      puts "Total number of bulk additions: #{@@counter_bulck_add} " 
      puts "Total number of bulk multiplication:#{@@counter_bulck_multiply} " 
  end
        

    
end  

complex1=ComplexNumber.new(1,30)
complex2=ComplexNumber.new(1,10)
complex3=ComplexNumber.new(1,10)
arr=[complex1,complex2,complex3]


sum=complex1.+(complex2)
sum.print


multiply=complex1.multiply(complex2)
multiply.print



result_add=ComplexNumber.bulk_add(arr)
result_add.print

result_multiply=ComplexNumber.bulk_multiply(arr)
result_multiply.print



ComplexNumber.get_stats














  