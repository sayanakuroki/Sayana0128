class DiagnosesController < ApplicationController
  def new
  end

  def create
    @recipient_name = params[:recipient_name].strip.downcase  # 入力を小文字に統一
    @scene = params[:scene]
    @image_color = params[:image_color]
  
    flowers = @recipient_name.chars.map do |char|  # 同じ文字でも異なるインスタンスを取得するためuniqを削除
      char_to_flower(char, @scene, @image_color)
    end
  
    @flowers = flowers.compact
    flower_ids = @flowers.map(&:id)  # 各文字に対応する花のIDを取得
  
    redirect_to diagnoses_result_path(
      recipient_name: @recipient_name,
      scene: @scene,
      image_color: @image_color,
      flower_ids: flower_ids.join(',')
    )
  end
  
  
  
  def result
    @recipient_name = params[:recipient_name]
    @scene = params[:scene]
    @image_color = params[:image_color]
    flower_ids = params[:flower_ids].split(',')
  
    @flowers = Flower.where(id: flower_ids)
  
    Rails.logger.debug "Flower IDs: #{flower_ids.inspect}"
    Rails.logger.debug "Selected flowers: #{@flowers.map(&:name)}"
  end
  


  private

  def char_to_flower(char, scene, color)
    mapping = {
      'birthday' => {
        'red' => {
          'a' => 'Amaranthus',
          'b' => 'Anthurium',
          'c' => 'Carnation',
          'd' => 'Dahlia',
          'e' => 'Echinacea',
          'f' => 'Freesia',
          'g' => 'Geranium',
          'h' => 'Hibiscus',
          'i' => 'Impatiens',
          'j' => 'Jasmine',
          'k' => 'Kalanchoe',
          'l' => 'Lobelia',
          'm' => 'Marigold',
          'n' => 'Nasturtium',
          'o' => 'Oleander',
          'p' => 'Poppy',
          'q' => 'Quince',
          'r' => 'Rose',
          's' => 'Salvia',
          't' => 'Tulip',
          'u' => 'Umbrella Plant',
          'v' => 'Verbena',
          'w' => 'Waxflower',
          'x' => 'Xeranthemum',
          'y' => 'Yucca',
          'z' => 'Zinnia'
        },
        'blue' => {
          'a' => 'Agapanthus',
          'b' => 'Bluebell',
          'c' => 'Cornflower',
          'd' => 'Delphinium',
          'e' => 'Eryngium',
          'f' => 'Forget-me-not',
          'g' => 'Gentian',
          'h' => 'Hydrangea',
          'i' => 'Iris',
          'j' => 'Jacaranda',
          'k' => 'Kangaroo Paw Blue',
          'l' => 'Larkspur',
          'm' => 'Morning Glory',
          'n' => 'Nigella',
          'o' => 'Oxalis',
          'p' => 'Plumbago',
          'q' => 'Queen’s Lace',
          'r' => 'Russian Sage',
          's' => 'Salvia Blue',
          't' => 'Thistle',
          'u' => 'Ultramarine Aster',
          'v' => 'Violet',
          'w' => 'Windflower',
          'x' => 'Xerophyllum',
          'y' => 'Yarrow Blue',
          'z' => 'Zephyranthes'
        },
        'yellow' => {
          'a' => 'Acacia',
          'b' => 'Buttercup',
          'c' => 'Coreopsis',
          'd' => 'Daffodil',
          'e' => 'Evening Primrose',
          'f' => 'Forsythia',
          'g' => 'Goldenrod',
          'h' => 'Helianthus',
          'i' => 'Inula',
          'j' => 'Jerusalem Artichoke',
          'k' => 'Kerria',
          'l' => 'Laburnum',
          'm' => 'Marigold',
          'n' => 'Narcissus',
          'o' => 'Oenothera',
          'p' => 'Primrose',
          'q' => 'Quince Yellow',
          'r' => 'Rudbeckia',
          's' => 'Sunflower',
          't' => 'Tickseed',
          'u' => 'Ulex',
          'v' => 'Verbascum',
          'w' => 'Wallflower',
          'x' => 'Xanthoceras',
          'y' => 'Yarrow Yellow',
          'z' => 'Zantedeschia'
        }
      },
      'anniversary' => {
        'red' => {
          'a' => 'Anemone',
          'b' => 'Begonia',
          'c' => 'Calla Lily',
          'd' => 'Dianthus',
          'e' => 'Euphorbia',
          'f' => 'Flamingo Flower',
          'g' => 'Gerbera',
          'h' => 'Hollyhock',
          'i' => 'Ixora',
          'j' => 'Jatropha',
          'k' => 'Kniphofia',
          'l' => 'Lantana',
          'm' => 'Mandevilla',
          'n' => 'Nerium',
          'o' => 'Orchid',
          'p' => 'Poinsettia',
          'q' => 'Quince',
          'r' => 'Ranunculus',
          's' => 'Salvia',
          't' => 'Torch Lily',
          'u' => 'Urceolina',
          'v' => 'Viburnum',
          'w' => 'Weigela',
          'x' => 'Xeronema',
          'y' => 'Yucca',
          'z' => 'Zephyranthes'
        },
    
        'blue' => {
          'a' => 'Aconitum',
          'b' => 'Blue Daisy',
          'c' => 'Clematis',
          'd' => 'Delphinium',
          'e' => 'Evolvulus',
          'f' => 'Felicia',
          'g' => 'Globularia',
          'h' => 'Hyacinth',
          'i' => 'Iris',
          'j' => 'Jasione',
          'k' => 'Kalmia',
          'l' => 'Lobelia',
          'm' => 'Myosotis',
          'n' => 'Nemophila',
          'o' => 'Omphalodes',
          'p' => 'Plumbago',
          'q' => 'Queen’s Lace',
          'r' => 'Russian Sage',
          's' => 'Scabiosa',
          't' => 'Trachelium',
          'u' => 'Utricularia',
          'v' => 'Veronica',
          'w' => 'Wahlenbergia',
          'x' => 'Xerophyllum',
          'y' => 'Yucca',
          'z' => 'Zephyranthes'
        },
        'yellow' => {
          'a' => 'Allamanda',
            'b' => 'Black-eyed Susan',
            'c' => 'Coreopsis',
            'd' => 'Dahlia',
            'e' => 'Evening Primrose',
            'f' => 'Freesia',
            'g' => 'Goldenrod',
            'h' => 'Helianthus',
            'i' => 'Inula',
            'j' => 'Jerusalem Artichoke',
            'k' => 'Kerria',
            'l' => 'Lantana',
            'm' => 'Marigold',
            'n' => 'Narcissus',
            'o' => 'Oenothera',
            'p' => 'Potentilla',
            'q' => 'Quince',
            'r' => 'Rudbeckia',
            's' => 'Sunflower',
            't' => 'Trollius',
            'u' => 'Ulex',
            'v' => 'Verbascum',
            'w' => 'Witch Hazel',
            'x' => 'Xyris',
            'y' => 'Yarrow',
            'z' => 'Zinnia'
        }
      }
    }
    
    default_flower = 'Rose' # デフォルトの花
    flower_name = mapping.dig(scene, color, char.downcase) || default_flower
    flower = Flower.find_by(name: flower_name)
  
    # デバッグ情報を出力
    Rails.logger.debug "Char: #{char}, Flower: #{flower_name}"
  
    flower
  end
end
