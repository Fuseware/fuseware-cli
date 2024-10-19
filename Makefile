# Compiler
CXX = g++

# Compiler flags
CXXFLAGS = -Wall -Wextra -std=c++17

# Directories
SRC_DIR = src
INC_DIR = include
BIN_DIR = bin

# Source files
SRC = $(wildcard $(SRC_DIR)/*.cpp)
OBJ = $(SRC:$(SRC_DIR)/%.cpp=$(BIN_DIR)/%.o)
TARGET = $(BIN_DIR)/fuseware
INSTALL_DIR = /usr/local/bin

# Rules
all: $(TARGET)

$(TARGET): $(OBJ)
	$(CXX) $(OBJ) -o $@

$(BIN_DIR)/%.o: $(SRC_DIR)/%.cpp
	@mkdir -p $(BIN_DIR) # Create bin directory if it doesn't exist
	$(CXX) $(CXXFLAGS) -I$(INC_DIR) -c $< -o $@

install: $(TARGET)
	install -Dm755 $(TARGET) $(INSTALL_DIR)/fuseware

clean:
	rm -rf $(BIN_DIR)/*.o $(TARGET)

uninstall:
	rm -f $(INSTALL_DIR)/fuseware

.PHONY: all clean
