describe "Level 3" do
  describe "Nested Structures" do
      let(:school) do 
        # Using let makes a value named school available in all of the tests.
        # This hash will reset at the beginning of each test.
        { 
          :name => "Happy Funtime School",
          :location => "NYC",
          :instructors => [ 
            {:name=>"Blake", :subject=>"Being Awesome" },
            {:name=>"Steven", :subject=>"Being Just 'OK'"},
            {:name=>"Jeff", :subject=>"Karaoke"}
          ],
          :students => [ 
            {:name => "Marissa", :grade => "B"},
            {:name=>"Billy", :grade => "F"},
            {:name => "Frank", :grade => "A"},
            {:name => "Sophie", :grade => "C"}
          ]
        }
      end

      it "modifies the hash" do 
        # modify school hash. Add key :founded_in with a value of 2013
        school[:founded_in] = 2013
      expect(school[:founded_in]).to eq(2013)
    end

    it "adds to a nested array" do
      # Add a student to the end of the school's students' array.
      school[:students].push({:name => "Jia", :grade => "A"})
      expect(school[:students].count).to eq(5)
      expect(school[:students].last[:name]).to_not eq("Sophie")
    end

    it "deletes values from nested array" do
      # Delete the student named "Billy" from the hash
      school[:students].delete_if {|student| student[:name] == "Billy" } 
      expect(school[:students].count).to eq(3)
      expect(school[:students].find {|student| student[:name] == 'Billy'}).to be_nil
    end

    it "modifies all values from nested array" do
      # Add a key to every student in the students array with a key of :semester and assign it the value "Summer".
      school[:students].each { |student| student[:semester] = "Summer"}
      expect(school[:students].all? {|student| student[:semester] == "Summer"}).to eq(true)
    end

    it "changes value of hash in nested array" do
      # Change Steven's subject to "Being Fantastic"
      school[:instructors].find { |inst| inst[:name] == "Steven"} [:subject] = "Being Fantastic"
      expect(school[:instructors].find{|instructor| instructor[:name] == "Steven"}[:subject]).to eq "Being Fantastic"
    end

    it "changes value of hash in nested students array" do
      # Change Frank's grade from "A" to "F".
      school[:students].find { |s| s[:name] == "Frank"} [:grade] = "F"
      expect(school[:students].find{|student| student[:name] == "Frank"}[:grade]).to eq "F"
    end

    it "finds student by their grade" do
      student_name = school[:students].find { |s| s[:grade] == "B"} [:name] # Return the name of the student with a "B".
      expect(student_name).to eq "Marissa"
    end

    it "finds subject by its instructor" do
      subject_name = school[:instructors].find { |ins| ins[:name] == "Jeff"} [:subject] # Return the subject of the instructor "Jeff".
      expect(subject_name).to eq("Karaoke")
    end

    it "returns all values from all hashes, including nested ones" do
      expect(STDOUT).to receive(:puts).with("Happy Funtime School")
      expect(STDOUT).to receive(:puts).with("NYC")
      expect(STDOUT).to receive(:puts).with("Blake")
      expect(STDOUT).to receive(:puts).with("Being Awesome")
      expect(STDOUT).to receive(:puts).with("Steven")
      expect(STDOUT).to receive(:puts).with("Being Just 'OK'")
      expect(STDOUT).to receive(:puts).with("Jeff")
      expect(STDOUT).to receive(:puts).with("Karaoke")
      expect(STDOUT).to receive(:puts).with("Marissa")
      expect(STDOUT).to receive(:puts).with("B")
      expect(STDOUT).to receive(:puts).with("Billy")
      expect(STDOUT).to receive(:puts).with("F")
      expect(STDOUT).to receive(:puts).with("Frank")
      expect(STDOUT).to receive(:puts).with("A")
      expect(STDOUT).to receive(:puts).with("Sophie")
      expect(STDOUT).to receive(:puts).with("C")

      # puts all the values in the school. NOTE: If this takes too long, skip it!
      iterate(school)
    end
  end

  #Prints value if it is not an array.
  #Arrays are recursively iterated
  def iterate(h)
    h.each do |k,v|
      
      if v.is_a?(Array)
        v.each { |a| iterate(a)}
      else
        puts "#{v}"
      end
    end

  end

end
