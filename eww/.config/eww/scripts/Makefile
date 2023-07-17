CXX = g++
LDFLAGS += -L /usr/lib -lboost_iostreams -lboost_system
CXXFLAGS = -std=c++14 -O3 $(LDFLAGS)
# 取得當前目錄中的所有 .cpp 文件
SOURCES := $(wildcard *.cpp)
# 將 .cpp 文件的名稱去掉擴展名作為目標文件名
TARGETS := $(SOURCES:.cpp=)

# 編譯每一個目標文件
all: $(TARGETS)

%: %.cpp
	@$(CXX) $(CXXFLAGS) -o $@ $<

# 清理編譯生成的文件
clean:
	rm -rf $(TARGETS)
