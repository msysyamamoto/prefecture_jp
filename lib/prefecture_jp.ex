defmodule PrefectureJp do
  @moduledoc """
  PrefectureJp is a library for converting the Japanese prefecture code and
  Japanese prefecture name.
  """

  defmodule Prefecture do
    @moduledoc """
    A struct responsible to hold prefecture information.
    """

    defstruct code: nil, name: nil, name_e: nil, name_h: nil, name_k: nil, area: nil

    @type t :: %__MODULE__{
            code: String.t(),
            name: String.t(),
            name_e: String.t(),
            name_h: String.t(),
            name_k: String.t(),
            area: String.t()
          }
  end

  @doc false
  defmacro __using__(colmun) do
    quote do
      @spec prefecture(PrefectureJp.Prefecture.t(), String.t()) :: any
      def prefecture(struct, key) do
        Map.fetch!(struct, unquote(colmun))
        |> PrefectureJp.find()
        |> Map.fetch!(key)
      end
    end
  end

  @doc ~S"""
  ## Examples

      iex> PrefectureJp.find("13").name
      "東京都"

      iex> PrefectureJp.find(code: "13").name
      "東京都"

      iex> PrefectureJp.find(name: "東京都").code
      "13"

      iex> PrefectureJp.find(name: "TOKYO").code
      "13"

      iex> PrefectureJp.find(name: "tokyo").code
      "13"

      iex> PrefectureJp.find(name: "トウキョウト").code
      "13"

      iex> PrefectureJp.find(name: "とうきょうと").code
      "13"

      iex> PrefectureJp.find("48")
      nil

      iex> PrefectureJp.find(code: "48")
      nil

      iex> PrefectureJp.find(name: "ワシントン")
      nil
  """
  @spec find(String.t()) :: any
  def find(code) when is_binary(code) do
    all()
    |> Enum.find(fn pref -> pref.code == code end)
  end

  @spec find([{atom, String.t()}]) :: any
  def find([{:code, code} | _]) when is_binary(code) do
    find(code)
  end

  @spec find([{atom, String.t()}]) :: any
  def find([{:name, name} | _]) when is_binary(name) do
    dname = String.downcase(name)

    all()
    |> Enum.find(fn pref ->
      Enum.any?([
        String.starts_with?(pref.name, dname),
        String.starts_with?(pref.name_e, dname),
        String.starts_with?(pref.name_h, dname),
        String.starts_with?(pref.name_k, dname)
      ])
    end)
  end

  @spec find(any) :: any
  def find(_) do
    nil
  end

  @spec all() :: [struct]
  def all do
    [
      %Prefecture{
        code: "01",
        name: "北海道",
        name_e: "hokkaido",
        name_h: "ほっかいどう",
        name_k: "ホッカイドウ",
        area: "北海道"
      },
      %Prefecture{
        code: "02",
        name: "青森県",
        name_e: "aomori",
        name_h: "あおもりけん",
        name_k: "アオモリケン",
        area: "東北"
      },
      %Prefecture{
        code: "03",
        name: "岩手県",
        name_e: "iwate",
        name_h: "いわてけん",
        name_k: "イワテケン",
        area: "東北"
      },
      %Prefecture{
        code: "04",
        name: "宮城県",
        name_e: "miyagi",
        name_h: "みやぎけん",
        name_k: "ミヤギケン",
        area: "東北"
      },
      %Prefecture{
        code: "05",
        name: "秋田県",
        name_e: "akita",
        name_h: "あきたけん",
        name_k: "アキタケン",
        area: "東北"
      },
      %Prefecture{
        code: "06",
        name: "山形県",
        name_e: "yamagata",
        name_h: "やまがたけん",
        name_k: "ヤマガタケン",
        area: "東北"
      },
      %Prefecture{
        code: "07",
        name: "福島県",
        name_e: "fukushima",
        name_h: "ふくしまけん",
        name_k: "フクシマケン",
        area: "東北"
      },
      %Prefecture{
        code: "08",
        name: "茨城県",
        name_e: "ibaraki",
        name_h: "いばらきけん",
        name_k: "イバラキケン",
        area: "関東"
      },
      %Prefecture{
        code: "09",
        name: "栃木県",
        name_e: "tochigi",
        name_h: "とちぎけん",
        name_k: "トチギケン",
        area: "関東"
      },
      %Prefecture{
        code: "10",
        name: "群馬県",
        name_e: "gunma",
        name_h: "ぐんまけん",
        name_k: "グンマケン",
        area: "関東"
      },
      %Prefecture{
        code: "11",
        name: "埼玉県",
        name_e: "saitama",
        name_h: "さいたまけん",
        name_k: "サイタマケン",
        area: "関東"
      },
      %Prefecture{
        code: "12",
        name: "千葉県",
        name_e: "chiba",
        name_h: "ちばけん",
        name_k: "チバケン",
        area: "関東"
      },
      %Prefecture{
        code: "13",
        name: "東京都",
        name_e: "tokyo",
        name_h: "とうきょうと",
        name_k: "トウキョウト",
        area: "関東"
      },
      %Prefecture{
        code: "14",
        name: "神奈川県",
        name_e: "kanagawa",
        name_h: "かながわけん",
        name_k: "カナガワケン",
        area: "関東"
      },
      %Prefecture{
        code: "15",
        name: "新潟県",
        name_e: "niigata",
        name_h: "にいがたけん",
        name_k: "ニイガタケン",
        area: "中部"
      },
      %Prefecture{
        code: "16",
        name: "富山県",
        name_e: "toyama",
        name_h: "とやまけん",
        name_k: "トヤマケン",
        area: "中部"
      },
      %Prefecture{
        code: "17",
        name: "石川県",
        name_e: "ishikawa",
        name_h: "いしかわけん",
        name_k: "イシカワケン",
        area: "中部"
      },
      %Prefecture{
        code: "18",
        name: "福井県",
        name_e: "fukui",
        name_h: "ふくいけん",
        name_k: "フクイケン",
        area: "中部"
      },
      %Prefecture{
        code: "19",
        name: "山梨県",
        name_e: "yamanashi",
        name_h: "やまなしけん",
        name_k: "ヤマナシケン",
        area: "中部"
      },
      %Prefecture{
        code: "20",
        name: "長野県",
        name_e: "nagano",
        name_h: "ながのけん",
        name_k: "ナガノケン",
        area: "中部"
      },
      %Prefecture{
        code: "21",
        name: "岐阜県",
        name_e: "gifu",
        name_h: "ぎふけん",
        name_k: "ギフケン",
        area: "中部"
      },
      %Prefecture{
        code: "22",
        name: "静岡県",
        name_e: "shizuoka",
        name_h: "しずおかけん",
        name_k: "シズオカケン",
        area: "中部"
      },
      %Prefecture{
        code: "23",
        name: "愛知県",
        name_e: "aichi",
        name_h: "あいちけん",
        name_k: "アイチケン",
        area: "中部"
      },
      %Prefecture{
        code: "24",
        name: "三重県",
        name_e: "mie",
        name_h: "みえけん",
        name_k: "ミエケン",
        area: "関西"
      },
      %Prefecture{
        code: "25",
        name: "滋賀県",
        name_e: "shiga",
        name_h: "しがけん",
        name_k: "シガケン",
        area: "関西"
      },
      %Prefecture{
        code: "26",
        name: "京都府",
        name_e: "kyoto",
        name_h: "きょうとふ",
        name_k: "キョウトフ",
        area: "関西"
      },
      %Prefecture{
        code: "27",
        name: "大阪府",
        name_e: "osaka",
        name_h: "おおさかふ",
        name_k: "オオサカフ",
        area: "関西"
      },
      %Prefecture{
        code: "28",
        name: "兵庫県",
        name_e: "hyogo",
        name_h: "ひょうごけん",
        name_k: "ヒョウゴケン",
        area: "関西"
      },
      %Prefecture{
        code: "29",
        name: "奈良県",
        name_e: "nara",
        name_h: "ならけん",
        name_k: "ナラケン",
        area: "関西"
      },
      %Prefecture{
        code: "30",
        name: "和歌山県",
        name_e: "wakayama",
        name_h: "わかやまけん",
        name_k: "ワカヤマケン",
        area: "関西"
      },
      %Prefecture{
        code: "31",
        name: "鳥取県",
        name_e: "tottori",
        name_h: "とっとりけん",
        name_k: "トットリケン",
        area: "中国"
      },
      %Prefecture{
        code: "32",
        name: "島根県",
        name_e: "shimane",
        name_h: "しまねけん",
        name_k: "シマネケン",
        area: "中国"
      },
      %Prefecture{
        code: "33",
        name: "岡山県",
        name_e: "okayama",
        name_h: "おかやまけん",
        name_k: "オカヤマケン",
        area: "中国"
      },
      %Prefecture{
        code: "34",
        name: "広島県",
        name_e: "hiroshima",
        name_h: "ひろしまけん",
        name_k: "ヒロシマケン",
        area: "中国"
      },
      %Prefecture{
        code: "35",
        name: "山口県",
        name_e: "yamaguchi",
        name_h: "やまぐちけん",
        name_k: "ヤマグチケン",
        area: "中国"
      },
      %Prefecture{
        code: "36",
        name: "徳島県",
        name_e: "tokushima",
        name_h: "とくしまけん",
        name_k: "トクシマケン",
        area: "四国"
      },
      %Prefecture{
        code: "37",
        name: "香川県",
        name_e: "kagawa",
        name_h: "かがわけん",
        name_k: "カガワケン",
        area: "四国"
      },
      %Prefecture{
        code: "38",
        name: "愛媛県",
        name_e: "ehime",
        name_h: "えひめけん",
        name_k: "エヒメケン",
        area: "四国"
      },
      %Prefecture{
        code: "39",
        name: "高知県",
        name_e: "kochi",
        name_h: "こうちけん",
        name_k: "コウチケン",
        area: "四国"
      },
      %Prefecture{
        code: "40",
        name: "福岡県",
        name_e: "fukuoka",
        name_h: "ふくおかけん",
        name_k: "フクオカケン",
        area: "九州"
      },
      %Prefecture{
        code: "41",
        name: "佐賀県",
        name_e: "saga",
        name_h: "さがけん",
        name_k: "サガケン",
        area: "九州"
      },
      %Prefecture{
        code: "42",
        name: "長崎県",
        name_e: "nagasaki",
        name_h: "ながさきけん",
        name_k: "ナガサキケン",
        area: "九州"
      },
      %Prefecture{
        code: "43",
        name: "熊本県",
        name_e: "kumamoto",
        name_h: "くまもとけん",
        name_k: "クマモトケン",
        area: "九州"
      },
      %Prefecture{
        code: "44",
        name: "大分県",
        name_e: "oita",
        name_h: "おおいたけん",
        name_k: "オオイタケン",
        area: "九州"
      },
      %Prefecture{
        code: "45",
        name: "宮崎県",
        name_e: "miyazaki",
        name_h: "みやざきけん",
        name_k: "ミヤザキケン",
        area: "九州"
      },
      %Prefecture{
        code: "46",
        name: "鹿児島県",
        name_e: "kagoshima",
        name_h: "かごしまけん",
        name_k: "カゴシマケン",
        area: "九州"
      },
      %Prefecture{
        code: "47",
        name: "沖縄県",
        name_e: "okinawa",
        name_h: "おきなわけん",
        name_k: "オキナワケン",
        area: "九州"
      }
    ]
  end
end
