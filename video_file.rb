require "find"

class String
  def naturalized
    scan(/[^\d\.]+|[\d\.]+/).collect { |f| f.match(/\d+(\.\d+)?/) ? f.to_f : f }
  end
end

class VideoFile
  class <<self

    def all_videos(dir, pattern)
      video_file = /\.avi|\.mp4|\.mkv|\.flv$/

      Find.find(dir).keep_if{|f| f =~ pattern}.keep_if{|f| f =~ video_file}
    end

    def sorted_videos(dir,pattern,sort_type = "alphabetical")
      files = all_videos(dir,pattern)

      case sort_type
      when "alphabetical"
        files.sort_by{|f| f.to_s.naturalized}
      end
    end
  end
end