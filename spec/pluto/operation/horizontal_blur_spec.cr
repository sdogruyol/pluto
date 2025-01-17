require "../../spec_helper"

describe Pluto::Operation::HorizontalBlur do
  describe "#horizontal_blur" do
    it "works with ImageGA" do
      image = ga_sample
      blurred_image = image.horizontal_blur(10)

      expect_digest image, "1a4d4e43e17f3245cefe5dd2c002fb85de079ae8"
      expect_digest blurred_image, "b04348fe463d35197cc57b0114596d9b78a20f55"
    end

    it "works with ImageRGBA" do
      image = rgba_sample
      blurred_image = image.horizontal_blur(10)

      expect_digest image, "d7fa6faf6eec5350f8de8b41f478bf7e8d217fa9"
      expect_digest blurred_image, "625be82cf07186fde56a81059c8149bc192bb1c9"
    end

    it "doesn't cause arithmetic overload" do
      with_sample("problem_images/28_arithmetic_overflow_in_blur.jpeg") do |io|
        image = Pluto::ImageRGBA.from_jpeg(io)
        expect_digest image.horizontal_blur(10), "d1e2b9363a2e7a36e738599cda8dab844a828b15"
      end
    end

    it "doesn't cause arithmetic overload again" do
      with_sample("problem_images/46_arithmetic_overflow_in_blur_again.jpeg") do |io|
        image = Pluto::ImageRGBA.from_jpeg(io)
        expect_digest image.horizontal_blur(5), "a6ce6aeb78bc3cc6cff8e39f932b3e778b127950"
      end
    end
  end

  describe "#horizontal_blur!" do
    it "works with ImageGA" do
      image = ga_sample
      image.horizontal_blur!(10)

      expect_digest image, "b04348fe463d35197cc57b0114596d9b78a20f55"
    end

    it "works with ImageRGBA" do
      image = rgba_sample
      image.horizontal_blur!(10)

      expect_digest image, "625be82cf07186fde56a81059c8149bc192bb1c9"
    end
  end
end
