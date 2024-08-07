FROM python:3.12

# Install dependencies
RUN apt-get update && apt-get install -y \
    curl \
    gnupg \
    lsb-release \
    && rm -rf /var/lib/apt/lists/*

# Install code-server
RUN curl -fsSL https://code-server.dev/install.sh | sh

# Set up working directory
WORKDIR /workspace

# Create and activate virtual environment
RUN python -m venv /workspace/venv

# Ensure the virtual environment is used for subsequent commands
ENV PATH="/workspace/venv/bin:$PATH"

# Install Python dependencies
COPY requirements.txt /workspace/
RUN pip install --no-cache-dir -r /workspace/requirements.txt

# Copy VS Code extensions
COPY extensions /extensions

# Install VS Code extensions
RUN mkdir -p /root/.local/share/code-server/extensions \
    && for extension in /extensions/*.vsix; do \
    code-server --install-extension $extension; \
    done

# Expose port for code-server
EXPOSE 8080

# Start code-server
CMD ["code-server", "--auth", "none", "--bind-addr", "0.0.0.0:8080"]
